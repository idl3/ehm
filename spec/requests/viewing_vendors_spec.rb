# encoding: utf-8
require 'spec_helper'

feature "Viewing an offer" do
  let!(:city)   { FactoryGirl.create(:city) }
  let!(:vendor) { FactoryGirl.create(:vendor) }

  subject { page }

  before "select the city and navigate to vendor page" do
    visit '/'
    select city.name
    click_button 'Συνέχεια'
    visit vendor_path(vendor)
  end

  # the vendors offers are listed
  # displays the categories menu

  it "sets the vendor in the navbar" do
    should have_css 'a.dropdown-toggle', text: vendor.name
  end

  it "displays the proper heading" do
    should have_selector 'h1', text: vendor.name
  end
end
