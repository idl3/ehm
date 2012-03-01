class Admin::SessionsController < ApplicationController
  include AdminSessionsHelper
  layout 'admin'

  def new
  end

  def create
    user = Vendor.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to admin_path, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

end