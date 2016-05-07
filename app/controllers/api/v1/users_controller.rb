class Api::V1::UsersController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token
  def signup
		user = User.create
		render json:{uuid:user.uuid}
  end
end
