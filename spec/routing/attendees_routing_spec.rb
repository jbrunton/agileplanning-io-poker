require "rails_helper"

RSpec.describe AttendeesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rooms/2/attendees").to route_to("attendees#index", :room_id => "2")
    end

    it "routes to #new" do
      expect(:get => "/rooms/2/join").to route_to("attendees#new", :room_id => "2")
    end

    it "routes to #show" do
      expect(:get => "/attendees/1").to route_to("attendees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/attendees/1/edit").to route_to("attendees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rooms/2/attendees").to route_to("attendees#create", :room_id => "2")
    end

    it "routes to #update" do
      expect(:put => "/attendees/1").to route_to("attendees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/attendees/1").to route_to("attendees#destroy", :id => "1")
    end

  end
end
