require "spec_helper"

describe StudioAssetsController do
  describe "routing" do

    it "routes to #index" do
      get("/studio_assets").should route_to("studio_assets#index")
    end

    it "routes to #new" do
      get("/studio_assets/new").should route_to("studio_assets#new")
    end

    it "routes to #show" do
      get("/studio_assets/1").should route_to("studio_assets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/studio_assets/1/edit").should route_to("studio_assets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/studio_assets").should route_to("studio_assets#create")
    end

    it "routes to #update" do
      put("/studio_assets/1").should route_to("studio_assets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/studio_assets/1").should route_to("studio_assets#destroy", :id => "1")
    end

  end
end
