module ApplicationHelper
  def all_vendors
    Vendor.all
  end

  def all_categories
    if params[:controller] == 'vendors'
      Vendor.find_by_username(params[:vendor]).categories.all
    else
      Category.all
    end
  end

  def active?(category)
    params[:id].to_i == category.id
  end
end
