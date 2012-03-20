# encoding: utf-8
require 'spec_helper'

describe "Offer page" do
  let(:offer) { Offer.find(5) }
  let(:city) { City.find(2) }

  before "select the city" do
    visit offer_path(offer)
    select city.name
    click_button "Save changes"
    visit offer_path(offer)
  end

  it "should display vendors name" do
    page.should have_content offer.vendor.name
  end

  it "should display offers title" do
    page.should have_selector 'h1', text: offer.title
  end

  it "should display start and expire date" do
    page.should have_content offer.starts_on
    page.should have_content offer.expires_on
  end


end
