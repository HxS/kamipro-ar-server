class Company::MarkersController < ApplicationController
  before_action :set_marker, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_staff

  # GET /markers
  # GET /markers.json
  def index
    @markers = Marker.with_company(current_staff.company.id)
  end

  # GET /markers/1
  # GET /markers/1.json
  def show
  end

  # GET /markers/new
  def new
    @marker = Marker.new
  end

  # GET /markers/1/edit
  def edit
  end

  # POST /markers
  # POST /markers.json
  def create
    @marker = Marker.new(marker_params)
    @marker.company = current_staff.company

    respond_to do |format|
      if @marker.save
        format.html { redirect_to company_markers_path, notice: '追加しました' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /markers/1
  # PATCH/PUT /markers/1.json
  def update
    respond_to do |format|
      if @marker.update(marker_params)
        format.html { redirect_to company_markers_path, notice: '更新しました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /markers/1
  # DELETE /markers/1.json
  def destroy
    @marker.destroy
    respond_to do |format|
      format.html { redirect_to company_markers_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
      unless current_staff.company == @marker.company
        redirect_to company_markers_path and return
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marker_params
      params.require(:marker).permit(:name, :image)
    end
end
