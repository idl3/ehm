require 'spec_helper'

describe Offer do
  let(:vendor) { FactoryGirl.create(:vendor) }
  before { @offer = vendor.offers.build(title: "Lorem ipsum", price: 1, initial_price: 123.45,
                                          starts_at: Date.today, expires_at: Date.tomorrow ) }

  subject { @offer }

  it { should respond_to :vendor_id }
  it { should respond_to :title }
  it { should respond_to :price }
  it { should respond_to :initial_price }
  it { should respond_to :starts_at }
  it { should respond_to :expires_at }
  its(:vendor) { should == vendor }

  it { should be_valid }

  describe "when vendor_id is not present" do
    before { @offer.vendor_id = nil }
    it { should_not be_valid }
  end

  # TITLE

  describe "with blank title" do
    before { @offer.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @offer.title = "a" * 5 }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @offer.title = "a" * 26 }
    it { should_not be_valid }
  end

  # PRICES

  describe "with blank price" do
    before { @offer.price = " " }
    it { should_not be_valid }
  end

  describe "when price isn't a numerical value" do
    before { @offer.price = "a" }
    it { should_not be_valid }
  end

  describe "when price is too long" do
    before { @offer.price = 1234.56 }
    it { should_not be_valid }
  end

  describe "when price isn't less than the initial_price" do
    before { @offer.price = 123.45 }
    it { should_not be_valid }
  end

  # DATES

  describe "with blank starting date" do
    before { @offer.starts_at = nil }
    it { should_not be_valid }
  end

  describe "with blank expiry date" do
    before { @offer.expires_at = nil }
    it { should_not be_valid }
  end

  describe "with starting date that's in the past" do
    before { @offer.starts_at = Date.yesterday }
    it { should_not be_valid }
  end

  describe "with expiry date same as starting date" do
    before { @offer.expires_at = @offer.starts_at }
    it { should_not be_valid }
  end
end
