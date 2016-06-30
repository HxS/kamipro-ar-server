class Company::AdvertisingsController < ApplicationController
  before_action :set_marker, only: [:index, :new, :create]
  before_action :set_advertising, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_staff

  # GET /advertisings
  # GET /advertisings.json
  def index
    @advertisings = Advertising.with_marker(@marker.id)
  end

  # GET /advertisings/1
  # GET /advertisings/1.json
  def show
    @reaches = Reach.with_advertising(params[:id])
    @impressions = Impression.with_advertising(params[:id])
  end

  # GET /advertisings/new
  def new
    @advertising = Advertising.new
    company = current_staff.company
    redirect_to company_marker_advertisings_path(@marker), alert: 'これ以上広告を追加することができません' if company.max_advertise <= Advertising.with_company(company.id).size
  end

  # GET /advertisings/1/edit
  def edit
  end

  # POST /advertisings
  # POST /advertisings.json
  def create
    @advertising = Advertising.new(advertising_params)
    @advertising.marker = @marker

    respond_to do |format|
      if @advertising.save
        format.html { redirect_to company_marker_advertisings_path(@marker), notice: '作成しました' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /advertisings/1
  # PATCH/PUT /advertisings/1.json
  def update
    respond_to do |format|
      if @advertising.update(advertising_params)
        format.html { redirect_to company_marker_advertisings_path(@advertising.marker), notice: '更新しました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /advertisings/1
  # DELETE /advertisings/1.json
  def destroy
    marker = @advertising.marker
    @advertising.destroy
    respond_to do |format|
      format.html { redirect_to company_marker_advertisings_path(marker), notice: '削除しました' }
    end
  end

  private
    def set_marker
      @marker = Marker.find(params[:marker_id])
      unless current_staff.company == @marker.company
        redirect_to company_markers_path and return
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_advertising
      @advertising = Advertising.find(params[:id])
      unless current_staff.company == @advertising.marker.company
        redirect_to company_markers_path and return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertising_params
      params.require(:advertising).permit(:image, :link, :enabled)
    end
end
