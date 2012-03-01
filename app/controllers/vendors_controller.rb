class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find_by_username(params[:username])
    @offers = @vendor.offers
  end
end