# encoding: utf-8

module SessionHelper
  def reset_sessions
    session[:vendor_id] = nil
    cookies[:city_id]   = nil
  end

  def reset_vendor
    session[:vendor_id] = nil
  end

  def current_city
    if city_selected?
      City.find(cookies[:city_id]).name
    else
      "Όλες οι πόλεις"
    end
  end

  def current_vendor
    if vendor_selected?
      Vendor.find(session[:vendor_id]).name
    else
      "Όλα τα καταστήματα"
    end
  end

  def city_selected?
    if cookies[:city_id] == nil
      false
    else
      true
    end
  end

  def vendor_selected?
    if session[:vendor_id] == nil
      false
    else
      true
    end
  end

  def check_city_and_redirect
    redirect_to select_city_url unless city_selected?
  end
end