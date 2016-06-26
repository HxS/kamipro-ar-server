class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_apps
  before_action :set_character

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company_app_ids = @company.apps.pluck(:id)
  end

  # GET /companies/1/edit
  def edit
    @company_app_ids = @company.apps.pluck(:id)
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        @company.apps.build
        format.html { redirect_to admin_companies_url, notice: '作成しました' }
        #format.html { redirect_to [:admin, @company], notice: 'Company was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        @company.apps.build
        format.html { redirect_to edit_admin_company_path(@company), notice: '更新しました' }
        #format.html { redirect_to [:admin, @company], notice: 'Company was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_url, notice: '削除しました' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def set_apps
      @apps = App.all
    end

    def set_character
      @characters = Character.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :enabled, :character_id, :max_marker, :max_advertise, app_ids:[])
    end
end
