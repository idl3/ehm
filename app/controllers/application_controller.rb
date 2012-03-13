class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :set_visited_before_cookie

  include SessionHelper

  private

  def set_visited_before_cookie
    cookies.permanent[:visited_before] = 1 if new_visitor?
  end

end
