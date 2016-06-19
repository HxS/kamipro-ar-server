class Company::StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:sign_in, :session_create]

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
        format.html { redirect_to [:company, @staff], notice: '作成しました' }
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
        format.html { redirect_to [:company, @staff], notice: '更新しました' }
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
      format.html { redirect_to admin_staffs_url, notice: 'スタッフを削除しました' }
    end
  end

  def sign_in
    render layout: nil
  end

  def session_create
    login_params = params.require(:session).permit(:email, :password)
    email, password = login_params[:email], login_params[:password]
    staff = Staff.find_by_email(email)
    if staff && staff.authenticate(password)
      session[:id] = staff.id
      redirect_to company_staff_path(staff), notice: 'ログインしました'
    else
      render json: staff
    end
  end

  def sign_out
    if current_user
      session[:id] = nil
    end
    redirect_to company_staffs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      params.require(:staff).permit(:company_id, :name, :email, :password, :password_confirmation)
    end
end
