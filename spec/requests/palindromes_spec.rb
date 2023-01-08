require 'rails_helper'

RSpec.describe "Palindromes", type: :request do
  describe "GET /input" do
    it 'Compares two responses with different values' do
      get palindromes_view_url, params: { num: 55 }
      response1 = response
      get palindromes_view_url, params: { num: 700 }
      expect(response.body).not_to eq(response1.body)
    end
  end
end
