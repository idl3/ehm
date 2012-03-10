class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @offers = @category.offers
  end
end