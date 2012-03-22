# encoding: utf-8
require 'spec_helper'

describe "Offer page" do
  let(:city) { City.first }
  let(:offer) { city.offers.first }

  before "select the city" do
    visit offer_path(offer)
    select city.name
    click_button "Συνέχεια"
    visit offer_path(offer)
  end

  it "should display vendors name" do
    page.should have_content offer.vendor.name
  end

  it "should display offer title" do
    page.should have_selector 'h1', text: offer.title
  end

  # it "should display offer price" do
  #   page.should have_content format_price(offer.price)
  # end

  # it "should display expiry date" do
  #   page.should have_content offer.expires_on
  # end


end
