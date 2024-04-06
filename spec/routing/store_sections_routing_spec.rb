require "rails_helper"

RSpec.describe StoreSectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/store_sections").to route_to("store_sections#index")
    end

    it "routes to #new" do
      expect(get: "/store_sections/new").to route_to("store_sections#new")
    end

    it "routes to #show" do
      expect(get: "/store_sections/1").to route_to("store_sections#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/store_sections/1/edit").to route_to("store_sections#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/store_sections").to route_to("store_sections#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/store_sections/1").to route_to("store_sections#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/store_sections/1").to route_to("store_sections#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/store_sections/1").to route_to("store_sections#destroy", id: "1")
    end
  end
end
