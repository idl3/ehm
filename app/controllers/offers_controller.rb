class OffersController < ApplicationController
  before_filter :redirect_if_no_cookie
  layout 'offer'

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
    @cities = @vendor.cities

    @more_from_vendor = @vendor.offers.where("id != ?", params[:id]).limit(8)
  end
end