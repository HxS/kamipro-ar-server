class Company::MarkersController < ApplicationController
  before_action :set_marker, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  # GET /markers
  # GET /markers.json
  def index
    @markers = Marker.all
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

    respond_to do |format|
      if @marker.save
        format.html { redirect_to [:admin, @marker], notice: 'Marker was successfully created.' }
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
        format.html { redirect_to [:admin, @marker], notice: 'Marker was successfully updated.' }
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
      format.html { redirect_to admin_markers_url, notice: 'Marker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marker
      @marker = Marker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marker_params
      params.require(:marker).permit(:company_id, :image_url)
    end
end
