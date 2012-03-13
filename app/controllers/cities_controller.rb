class CitiesController < ApplicationController
  before_filter :reset_vendor

  def show
    @city = City.find(params[:id])
    @offers = @city.offers

    session[:city_id] = @city.id
  end

end