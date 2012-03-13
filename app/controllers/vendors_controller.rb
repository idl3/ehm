class VendorsController < ApplicationController
  def show
    category = params[:c]
    @vendor = Vendor.find_by_username(params[:vendor])
    if category
      @offers = @vendor.offers.running_now.where("category_id = #{category}")
    else
      @offers = @vendor.offers.running_now
    end

    session[:vendor_id] = @vendor.id
  end
end