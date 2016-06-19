class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :handle_500 unless Rails.env.development?

  def handle_500(exception = nil)
    render json: { message: '内部エラー' }, status: 500
  end

  def authenticate
    redirect_to sign_in_company_staffs_path unless session[:id]
  end

  def current_user
    if session[:id]
      Staff.find_by(session[:id])
    end
  end

  helper_method :current_user

end
