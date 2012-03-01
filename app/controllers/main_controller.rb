class MainController < ApplicationController
  def home
    @offers = Offer.all
  end
end