require 'spec_helper'

describe City do
  before { @city = City.new(name: "City") }

  subject { @city }

  it { should be_valid }
  it { should respond_to :name }

  describe "with blank title" do
    before { @city.name = " " }
    it { should_not be_valid }
  end
end
