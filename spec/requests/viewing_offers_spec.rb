# encoding: utf-8
require 'spec_helper'

feature "Viewing an offer" do
  let!(:city)   { FactoryGirl.create(:city) }
  let!(:vendor) { FactoryGirl.create(:vendor) }
  let!(:offer)  { FactoryGirl.create(:offer, vendor: vendor) }

  subject { page }

  before "select the city and navigate to offer page" do
    visit '/'
    select city.name
    click_button 'Συνέχεια'
    visit offer_path(offer)
  end

  it "displays vendors name" do
    should have_content "από #{offer.vendor.name}"
  end

  it "displays offer title" do
    should have_selector 'h1', text: offer.title
  end

  it "displays offer price and initial price" do
    should have_content price(offer.price)
    should have_content price(offer.initial_price)
  end

  it "displays expiry date" do
    should have_content expires(offer)
  end

  it "displays discount value" do
    should have_content discount(offer)
  end

  it "displays win value" do
    should have_content win(offer)
  end

  it "sets the vendor of the offer in the navbar" do
    should have_css 'a.dropdown-toggle', text: vendor.name
  end

  # should render more offers from vendor
end
