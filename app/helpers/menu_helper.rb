# encoding: utf-8

module MenuHelper
  def all_vendors
    if stored_city?
      City.find(cookies[:city_id]).vendors
    else
      Vendor.all
    end
  end

  def all_cities
    City.all
  end

  def current_city_name
    if stored_city?
      City.find(cookies[:city_id]).name
    else
      City.initial.name
    end
  end

  def current_vendor_name
    if stored_vendor?
      Vendor.find(session[:vendor_id]).name
    else
      "Όλα τα Super Market"
    end
  end

end