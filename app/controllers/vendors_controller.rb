class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find_by_username(params[:vendor])
    @offers = @vendor.offers
  end
end