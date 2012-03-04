class Admin::OffersController < Admin::AdminController
  def index
    @offers = current_user.offers.all
  end

  def new
    @offer = current_user.offers.build
  end

  def create
    @offer = current_user.offers.build(params[:offer])
    if @offer.save
      flash[:success] = "Offer created!"
      redirect_to admin_offer_path(@offer)
    else
      render "new"
    end
  end

  def edit
    @offer = current_user.offers.find(params[:id])
  end

  def show
    @offer = current_user.offers.find(params[:id])
  end
end