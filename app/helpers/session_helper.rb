module SessionHelper
  def reset_vendor
    session[:vendor_id] = nil
  end

  def stored_city
    stored_city? ? City.find(cookies[:city_id]) : City.find_by_name(params[:city])
  end

  def current_city
    City.find_by_name(params[:city])
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