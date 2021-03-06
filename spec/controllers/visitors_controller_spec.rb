require "rails_helper"

RSpec.describe VisitorsController, :type => :controller do
  describe "GET #index" do
    it "loads all of the service categories into @services" do
      service = Category.create(name: "services")
      get :index
      expect(assigns(:services)).to eq(service)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end