# encoding: utf-8
require 'spec_helper'

describe "Visiting the homepage" do
  let!(:city) { FactoryGirl.create(:city) }

  subject { page }

  describe "for the first time" do
    it "redirects to the Welcome page" do
      visit '/'
      current_path.should == welcome_path
      should have_content 'Επιλέξτε την πόλη σας:'
    end
  end

  describe "for the second time" do
    it "redirects to the city show page" do
      visit '/'
      select city.name
      click_button 'Συνέχεια'
      visit '/'
      current_path.should == root_path
    end
  end
end
