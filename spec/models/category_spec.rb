require 'spec_helper'

describe Category do
  before { @category = Category.new(title: "Some category") }

  subject { @category }

  it { should be_valid }
  it { should respond_to :title }

  describe "with blank title" do
    before { @category.title = " " }
    it { should_not be_valid }
  end
end
