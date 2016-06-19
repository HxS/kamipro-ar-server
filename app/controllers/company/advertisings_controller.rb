class Company::AdvertisingsController < ApplicationController
  before_action :set_advertising, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  # GET /advertisings
  # GET /advertisings.json
  def index
    @advertisings = Advertising.all
  end

  # GET /advertisings/1
  # GET /advertisings/1.json
  def show
  end

  # GET /advertisings/new
  def new
    @advertising = Advertising.new
  end

  # GET /advertisings/1/edit
  def edit
  end

  # POST /advertisings
  # POST /advertisings.json
  def create
    @advertising = Advertising.new(advertising_params)

    respond_to do |format|
      if @advertising.save
        format.html { redirect_to [:admin, @advertising], notice: 'Advertising was successfully created.' }
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
        format.html { redirect_to [:admin, @advertising], notice: 'Advertising was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /advertisings/1
  # DELETE /advertisings/1.json
  def destroy
    @advertising.destroy
    respond_to do |format|
      format.html { redirect_to admin_advertisings_url, notice: 'Advertising was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertising
      @advertising = Advertising.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertising_params
      params.require(:advertising).permit(:company_id, :image_url, :link_url)
    end
end
