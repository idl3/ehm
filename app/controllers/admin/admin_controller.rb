class Admin::AdminController < ApplicationController
  before_filter :require_login
  layout 'admin'
  include Admin::SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:error] = t(:login_required)
      redirect_to admin_login_url
    end
  end
end