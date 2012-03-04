class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = Vendor.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      current_user = user
      redirect_to admin_path, notice: t(:welcome_flash)
    else
      flash[:error] = t(:failed_login_flash)
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path, notice: t(:logged_out)
  end
end