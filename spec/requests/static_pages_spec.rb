require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/static_pages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/static_pages/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /news" do
    it "returns http success" do
      get "/static_pages/news"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /traditions" do
    it "returns http success" do
      get "/static_pages/traditions"
      expect(response).to have_http_status(:success)
    end
  end

end
