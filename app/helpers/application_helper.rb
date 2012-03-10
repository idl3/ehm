module ApplicationHelper
  def all_vendors
    Vendor.all
  end

  def all_categories
    Category.all
  end

  def active?(category)
    params[:id].to_i == category.id
  end
end
