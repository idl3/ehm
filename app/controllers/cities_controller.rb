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
  end

  protected
  def set_cookie
    if params.has_key?(:selected_city) # then he's coming from the welcome page
      cookies[:city_id] = City.find(params[:selected_city][:id]).id
    elsif params.has_key?(:id)
      cookies[:city_id] = params[:id]
    end
  end

end