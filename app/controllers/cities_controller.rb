class CitiesController < ApplicationController
  before_filter :reset_vendor, only: [:show]
  before_filter :redirect_to_stored_city, only: [:home]
  before_filter :store_initial_city, only: [:home]

  def home
    @city = City.initial
    @offers = @city.offers
  end

  def show
    category = params[:c]
    @city = City.find_by_name(params[:city])

    if category
      @offers = @city.offers.where("category_id = #{category}")
    else
      @offers = @city.offers
    end
    store_city
  end

  private

  def store_city
    cookies.permanent[:city_id] = @city.id
  end

  def redirect_to_stored_city
    redirect_to city_path(stored_city) if stored_city?
  end

  def store_initial_city
    cookies.permanent[:city_id] = City.initial.id unless stored_city?
  end
end