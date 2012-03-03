class Admin::SessionsController < ApplicationController
  layout 'admin'

  def new
  end

  def create
    user = Vendor.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      current_user = user
      redirect_to admin_path, notice: "Logged in!"
    else
      flash[:error] = "Invalid email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path, notice: "Logged out."
  end
end