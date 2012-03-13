class CitiesController < ApplicationController
  before_filter :reset_vendor, only: [:show]
  before_filter :redirect_to_stored_city, only: [:home]

  def home
    @city = City.initial
    @offers = @city.offers.running_now
  end

  def show
    @city = City.find_by_name(params[:city])
    @offers = @city.offers.running_now
    store_city
  end

  private

  def store_city
    cookies.permanent[:city_id] = @city.id
  end

  def redirect_to_stored_city
    redirect_to city_path(stored_city) if stored_city?
  end
end