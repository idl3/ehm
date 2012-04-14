class VendorsController < ApplicationController
  before_filter :redirect_if_no_cookie

  def show
    category = params[:c]
    @vendor = Vendor.find_by_username(params[:vendor])

    if category
      @offers = @vendor.offers.active.where("category_id = #{category}")
    else
      @offers = @vendor.offers.active
    end
    store_vendor
  end

  def expiring
    
  end

  private

  def store_vendor
    session[:vendor_id] = @vendor.id
  end
end