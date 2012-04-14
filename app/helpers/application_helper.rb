# encoding: utf-8

module ApplicationHelper
  def vendor_categories
    Vendor.find(params[:id]).categories.all
  end

  def city_categories
    current_city.categories
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def breadcrumbs
    case controller_name
    when 'vendors'
      heading = current_city.name + " › " + @vendor.name
      params[:c].nil? ? heading : heading + " › " + active_category.title
    when 'cities'
      heading = @city.name + " › " + "Όλα τα Supermarkets"
      params[:c].nil? ? heading : heading + " › " + active_category.title
    end
  end

  def active_category
    Category.find(params[:c])
  end
end
