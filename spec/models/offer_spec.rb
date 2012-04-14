require 'spec_helper'

describe Offer do
  let(:vendor) { FactoryGirl.create(:vendor) }
  before { @offer = vendor.offers.build(title: "Lorem ipsum", price: 1, initial_price: 123.45,
                                          starts_on: Date.today, expires_on: Date.tomorrow, category_id: 1) }

  subject { @offer }

  it { should respond_to :vendor_id }
  it { should respond_to :category_id }
  it { should respond_to :title }
  it { should respond_to :price }
  it { should respond_to :initial_price }
  it { should respond_to :starts_on }
  it { should respond_to :expires_on }

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
    before { @offer.title = "a" * 61 }
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
    before { @offer.starts_on = nil }
    it { should_not be_valid }
  end

  describe "with blank expiry date" do
    before { @offer.expires_on = nil }
    it { should_not be_valid }
  end

  describe "with expiry date same as starting date" do
    before { @offer.expires_on = @offer.starts_on }
    it { should_not be_valid }
  end
end
