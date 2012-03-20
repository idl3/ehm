class OffersController < ApplicationController
  before_filter :redirect_if_no_cookie
  layout 'offer'

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
    @cities = @vendor.cities
  end
end