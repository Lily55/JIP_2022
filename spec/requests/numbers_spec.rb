require 'rails_helper'

RSpec.describe "Numbers", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/numbers/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/numbers/show"
      expect(response).to have_http_status(:success)
    end
  end

end
