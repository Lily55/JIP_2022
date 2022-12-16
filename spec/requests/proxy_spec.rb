require 'rails_helper'

RSpec.describe "Proxies", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/proxy/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/proxy/show"
      expect(response).to have_http_status(:success)
    end
  end

end
