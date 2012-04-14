class CitiesController < ApplicationController
  before_filter :set_cookie
  before_filter :redirect_if_no_cookie
  before_filter :reset_vendor

  def show
    @city = City.find(cookies[:city_id])

    if params[:c]
      @offers = @city.offers.active.where("category_id = #{params[:c]}").paginate(:page => params[:page])
    else
      @offers = @city.offers.active.paginate(:page => params[:page])
    end

    cookies[:city_id] = @city.id
  end

  def expiring

  end

  protected

  def set_cookie
    if params.has_key?(:selected_city)
      cookies[:city_id] = City.find(params[:selected_city][:id])
    elsif params.has_key?(:city)
      cookies[:city_id] = City.find_by_name(params[:city]).id
    end
  end

end