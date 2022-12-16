require 'rails_helper'

RSpec.describe "Numbers", type: :request do
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

  describe 'POST /numbers' do
    context 'when params are right' do
      before {  post numbers_path, params: { n: Faker::Number.number(digits: 4) }, xhr: true }
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
      it 'renders result templates' do
        expect(response).to render_template(:show)
        expect(response).to render_template(:_output_table)
      end
      it 'responds with turbo stream' do
        expect(response.content_type).to match(%r{text/vnd.turbo-stream.html})
      end
    end

    context 'when params are wrongs' do
      it 'returns 302 http when params are empty' do
        post numbers_path, params: { n: '' }, xhr: true
        expect(response).to have_http_status(200)
      end
      it 'returns 302 http when num <= 0' do
        post numbers_path, params: { n: Faker::Number.within(range: -9999..0) }, xhr: true
        expect(response).to have_http_status(200)
      end
    end
  end
end
