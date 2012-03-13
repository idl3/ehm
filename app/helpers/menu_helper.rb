# encoding: utf-8

module MenuHelper
  def all_vendors
    if city_selected?
      City.find(session[:city_id]).vendors
    else
      Vendor.all
    end
  end

  def all_cities
    City.all
  end

end