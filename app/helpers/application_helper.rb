module ApplicationHelper

# FINISH THIS FOR ALL CONTROLLERS
  def vendor_categories
    Vendor.find_by_username(params[:vendor]).categories.all
  end

  def city_categories
    stored_city.categories
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
