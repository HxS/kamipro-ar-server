class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	rescue_from Exception, with: :handle_500 unless Rails.env.development?

	def handle_500(exception = nil)
		render json: { message: '内部エラー' }, status: 500
	end

end
