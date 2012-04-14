# encoding: utf-8
require 'spec_helper'

describe "Homepage" do
  let(:city) { City.first }
  before { visit root_path }

  subject { page }

  describe "as new user (cookie not set)" do
    it "redirects to choose city" do
      current_path.should == welcome_path
      should have_content "Επιλέξτε την πόλη σας:"
    end

    describe "after choosing city" do
      it "takes you to the homepage" do
        select city.name
        click_button "Συνέχεια"

        current_path.should == root_path
        should have_css 'a.dropdown-toggle', text: city.name
        should have_css 'a.dropdown-toggle', text: 'Όλα τα Supermarkets'
      end

      it "displays offers from different vendors" do
      end

    end
  end

end
