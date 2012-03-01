class Admin::PagesController < ApplicationController
  include AdminSessionsHelper
  layout 'admin'

  def index
  end
end