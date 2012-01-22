require "spec_helper"

describe CoworkerRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/coworker_requests").should route_to("coworker_requests#index")
    end

    it "routes to #new" do
      get("/coworker_requests/new").should route_to("coworker_requests#new")
    end

    it "routes to #show" do
      get("/coworker_requests/1").should route_to("coworker_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coworker_requests/1/edit").should route_to("coworker_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coworker_requests").should route_to("coworker_requests#create")
    end

    it "routes to #update" do
      put("/coworker_requests/1").should route_to("coworker_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coworker_requests/1").should route_to("coworker_requests#destroy", :id => "1")
    end

  end
end
