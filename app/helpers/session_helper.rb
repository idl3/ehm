module SessionHelper
  def reset_vendor
    session[:vendor_id] = nil
  end

  def current_city
    City.find(cookies[:city_id])
  end

  def stored_city?
    !cookies[:city_id].nil?
  end

  def stored_vendor?
    !session[:vendor_id].nil?
  end

  def redirect_if_no_cookie
    redirect_to welcome_path unless stored_city?
  end

end