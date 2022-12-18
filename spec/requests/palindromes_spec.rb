require 'rails_helper'

RSpec.describe "Palindromes", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/palindromes/input"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /view" do
    it "returns http success" do
      get "/palindromes/view"
      expect(response).to have_http_status(:success)
    end
  end

end
