class OffersController < ApplicationController
  layout 'offer'

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
    @cities = @vendor.cities
  end
end