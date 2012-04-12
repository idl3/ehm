require 'spec_helper'

describe CitiesController do

  describe "GET show" do

    describe "with city cookie NOT set" do
      it "redirects to welcome path" do
        get :show
        response.should redirect_to welcome_path
        assigns(:city).should eq nil
      end
    end

    describe "with city cookie set" do
      it "lists all offers from stored city" do
        cookies[:city_id] = 1
        get :show
        response.should be_success
        response.should render_template 'show'
        assigns(:city).should eq City.find(cookies[:city_id])
      end
    end

  end
end