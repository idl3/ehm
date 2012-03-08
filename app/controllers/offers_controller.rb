class OffersController < ApplicationController
  def index
    @offers = Offer.running_now
  end

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
  end

  def expiring
    @offers = Offer.expiring_soon
    render 'index'
  end
end