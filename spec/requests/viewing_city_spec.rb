# encoding: utf-8
require 'spec_helper'

feature "Visiting a City page" do
  let!(:city)   { FactoryGirl.create(:city) }
  let!(:vendor) { FactoryGirl.create(:vendor) }

  subject { page }

  scenario "as a new user (cookie not set)" do
    visit city_path(city)
    current_path.should == welcome_path
  end

  # the vendors offers are listed
  # displays the categories menu

  # it "sets the vendor in the navbar" do
  #   should have_css 'a.dropdown-toggle', text: vendor.name
  # end

  # it "displays the proper heading" do
  #   should have_selector 'h1', text: vendor.name
  # end
end
