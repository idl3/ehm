# encoding: utf-8

module MenuHelper
  def all_vendors
    stored_city? ? City.find(cookies[:city_id]).vendors : Vendor.all
  end

  def all_cities
    City.all
  end

  def current_vendor_name
    stored_vendor? ? Vendor.find(session[:vendor_id]).name : "Όλα τα Supermarkets"
  end

  def active_category?(category)
    params[:c].to_i == category.id
  end
end