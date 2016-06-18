class Admin::StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :set_company

  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to edit_admin_staff_path(@staff) }
        #format.html { redirect_to [:admin, @staff], notice: 'Staff was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to edit_admin_staff_path(@staff) }
        format.html { redirect_to [:admin, @staff], notice: 'Staff was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to admin_staffs_url, notice: 'Staff was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end
    def set_company
      @companies = Company.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:name, :company_id, :email, :password, :password_confirmation)
    end
end
