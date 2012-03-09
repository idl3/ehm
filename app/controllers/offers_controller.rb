class OffersController < ApplicationController
  def index
    @offers = Offer.running_now.paginate(page: params[:page])
  end

  def show
    @offer = Offer.find(params[:id])
    @vendor = @offer.vendor
  end

  def expiring
    @offers = Offer.expiring_soon.paginate(page: params[:page])
    render 'index'
  end
end