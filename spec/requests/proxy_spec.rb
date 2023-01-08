require 'rails_helper'

RSpec.describe "Proxies", type: :request do
  describe "GET /output" do
    it 'returns html when "server" side is chosen' do
      get 'proxy/show', params: { upper: 36, side: 'server' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      end


    context "when URI is valid" do
      before { get 'proxy/show', params: { upper: 36, side: 'client' } }
      it 'returns xml when "client" side is chosen' do
        expect(response.content_type).to eq 'application/xml; charset=utf-8'
      end
    end
  end
end
