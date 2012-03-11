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
    case controller_name
    when 'vendors'
      params[:c].to_i == category.id
    when 'categories'
      params[:id].to_i == category.id
    when 'offers'
      @offer.category.id == category.id if action_name == "show"
    end
  end

end
