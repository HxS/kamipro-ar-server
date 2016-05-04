class Api::V1::UsersController < ApplicationController
	  def signup
			user = User.create
			render json:{uuid:user.uuid}
	  end
end
