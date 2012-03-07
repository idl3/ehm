class OffersController < ApplicationController
  def index
    @offers = Offer.limit(20)
  end

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
  end

  def expiring
  end
end