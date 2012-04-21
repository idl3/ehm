# encoding: utf-8
require 'spec_helper'

feature "Viewing an offer" do
  let!(:city) { FactoryGirl.create(:city) }
  let!(:offer) { FactoryGirl.create(:offer) }

  subject { page }

  before "select the city and navigate to offer page" do
    visit '/'
    select city.name
    click_button 'Συνέχεια'
    visit offer_path(offer)
  end

  it "should display vendors name" do
    should have_content offer.vendor.name
  end

  it "should display offer title" do
    should have_selector 'h1', text: offer.title
  end

  it "should display offer price and initial price" do
    should have_content price(offer.price)
    should have_content price(offer.initial_price)
  end

  it "should display expiry date" do
    should have_content expires(offer)
  end

  it "should display discount value" do
    should have_content discount(offer)
  end

  it "should display win value" do
    should have_content win(offer)
  end

  # should render more offers from vendor
end
