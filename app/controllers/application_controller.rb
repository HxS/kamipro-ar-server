class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :handle_500 unless Rails.env.development?

  def handle_500(exception = nil)
    render json: { message: '内部エラー' }, status: 500
  end

  def authenticate_staff
    redirect_to sign_in_company_staffs_path unless session[:id]
  end

  def authenticate_admin
    redirect_to admin_signin_path unless session[:admin_id]
  end

  def current_staff
    if session[:id]
      Staff.find_by(session[:id])
    end
  end

  def current_admin
    if session[:admin_id]
      Admin.find(session[:admin_id])
    end
  end

  helper_method :current_staff
  helper_method :current_admin

end
