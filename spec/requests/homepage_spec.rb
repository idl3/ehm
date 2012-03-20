# encoding: utf-8
require 'spec_helper'

describe "Homepage" do
  let(:city) { City.find(2) }
  before { visit root_path }

  describe "as new user (cookie not set)" do
    it "redirects to choose city" do
      current_path.should == welcome_path
      page.should have_content "CHOOSE YOUR CITY"
    end

    describe "after choosing city" do
      it "takes you to the homepage" do
        select city.name
        click_button "Save changes"

        current_path.should == root_path
        page.should have_selector 'title', text: city.name
      end
    end
  end

end
