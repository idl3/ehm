# encoding: utf-8
require 'spec_helper'

describe "Homepage" do
  let(:city) { City.find(2) }
  before { visit root_path }

  describe "as new user (cookie not set)" do
    it "redirects to choose city" do
      current_path.should == welcome_path
      page.should have_content "Επιλέξτε την πόλη σας:"
    end

    describe "after choosing city" do
      it "takes you to the homepage" do
        select city.name
        click_button "Συνέχεια"

        current_path.should == root_path
        page.should have_selector 'title', text: city.name
      end
    end
  end

end
