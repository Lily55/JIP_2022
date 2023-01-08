
require 'faker'
require 'rails_helper'

RSpec.describe "Examples", type: :request do
  describe 'GET /index' do
    it 'GET /index' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'hgfhf' do
      get '/example/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /' do
    before { get root_path }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders input template' do
      expect(response).to render_template(:input)
    end
    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
end
