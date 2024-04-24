require "rails_helper"

RSpec.describe DailySnapshotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/daily_snapshots").to route_to("daily_snapshots#index")
    end

    it "routes to #new" do
      expect(get: "/daily_snapshots/new").to route_to("daily_snapshots#new")
    end

    it "routes to #show" do
      expect(get: "/daily_snapshots/1").to route_to("daily_snapshots#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/daily_snapshots/1/edit").to route_to("daily_snapshots#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/daily_snapshots").to route_to("daily_snapshots#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/daily_snapshots/1").to route_to("daily_snapshots#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/daily_snapshots/1").to route_to("daily_snapshots#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/daily_snapshots/1").to route_to("daily_snapshots#destroy", id: "1")
    end
  end
end
