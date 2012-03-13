module SessionHelper
  def reset_vendor
    session[:vendor_id] = nil
  end

  def stored_city
    City.find(cookies[:city_id])
  end

  def stored_city?
    !cookies[:city_id].nil?
  end

  def stored_vendor?
    !session[:vendor_id].nil?
  end

  def new_visitor?
    cookies[:visited_before].nil?
  end

end