class Admin::SessionsController < ApplicationController

  def signin
  end

  def signout
    session[:admin_id] = nil
    redirect_to admin_signin_path
  end

  def create
    login_params = params.require(:session).permit(:email, :password)
    email, password = login_params[:email], login_params[:password]
    admin = Admin.find_by(email:email)
    if admin && admin.authenticate(password)
      session[:admin_id] = admin.id
      redirect_to admin_path
    else
      render :signin
    end
  end
end
