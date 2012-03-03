class Admin::AdminController < ApplicationController
  before_filter :require_login
  include Admin::SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:error] = "Please login."
      redirect_to admin_login_url
    end
  end
end