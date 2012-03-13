class CitiesController < ApplicationController
  before_filter :check_city_and_redirect, only: [:show]
  before_filter :reset_vendor
  layout 'welcome', only: [:select_city]

  def select_city

  end

  def show
    @city = City.find_by_name(params[:city])
    @offers = @city.offers

    cookies.permanent[:city_id] = @city.id
  end

  private

  def check_city_and_redirect
    redirect_to select_city_url unless city_selected?
  end

end