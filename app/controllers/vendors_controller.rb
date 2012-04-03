class VendorsController < ApplicationController
  before_filter :redirect_if_no_cookie

  def show
    category = params[:c]
    @vendor = Vendor.find(params[:vendor])

    if category
      @offers = @vendor.offers.where("category_id = #{category}")
    else
      @offers = @vendor.offers
    end
    store_vendor
  end

  private

  def store_vendor
    session[:vendor_id] = @vendor.id
  end
end