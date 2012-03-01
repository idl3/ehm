class Admin::PagesController < ApplicationController
  http_basic_authenticate_with :name => "t", :password => "t"

  layout 'admin'

  def index
    
  end
end