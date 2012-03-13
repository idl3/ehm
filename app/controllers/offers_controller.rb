class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
  end
end