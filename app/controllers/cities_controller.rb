class CitiesController < ApplicationController
  before_filter :set_cookie
  before_filter :redirect_if_no_cookie
  before_filter :reset_vendor

  def show
    @city = City.find(cookies[:city_id])

    if params[:c]
      @offers = @city.offers.where("category_id = #{params[:c]}")
    else
      @offers = @city.offers
    end

    cookies[:city_id] = @city.id
  end

  protected

  def set_cookie
    if params.has_key?(:initial_city)
      cookies[:city_id] = City.find(params[:initial_city][:id])
    elsif params.has_key?(:city)
      cookies[:city_id] = City.find_by_name(params[:city]).id
    end
  end

end