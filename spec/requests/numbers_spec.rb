require 'rails_helper'

RSpec.describe "Numbers", type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/', params: { upper: 10, format: :rss }

      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('application/rss+xml')
    end

    it 'Compares two responses with different values' do
      get '/', params: { upper: rand(1..55), format: :xml }
      response1 = response
      get '/', params: { upper: rand(30..700), format: :xml }

      expect(response.body).not_to eq(response1.body)
    end
  end
end
