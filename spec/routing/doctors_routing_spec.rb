require "rails_helper"

<<<<<<< HEAD
RSpec.describe DoctorsController, type: :routing do
=======
RSpec.describe DoctorsController do
  describe "routing" do
>>>>>>> 9c1f502a3d1eecc8cbfb34bd06ebb614f46243ca


  describe "routing" do
    it "routes to #index" do
      expect(:get => "/doctors").to route_to("doctors#index")
    end
    

    it "routes to #new" do
      expect(:get => "/doctors/new").to route_to("doctors#new")
    end

    it "routes to #show" do
      sign_in User.first
      expect(:get => "/doctors/1").to route_to("doctors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/doctors/1/edit").to route_to("doctors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/doctors").to route_to("doctors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/doctors/1").to route_to("doctors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/doctors/1").to route_to("doctors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doctors/1").to route_to("doctors#destroy", :id => "1")
    end

  end
end
