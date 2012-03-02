module Admin::SessionsHelper

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= Vendor.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end
end