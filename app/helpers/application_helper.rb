module ApplicationHelper
  def vendor_categories
    Vendor.find_by_username(params[:vendor]).categories.all
  end

  def city_categories
    current_city.categories
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
