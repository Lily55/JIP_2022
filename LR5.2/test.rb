# frozen_string_literal: true

require './logic'

RSpec.describe NumberMax do
  describe '#function_of_search' do
    let(:arr) { %w[5 5 5 5 5 5 3 4 4] }
    it 'should be CountMax = 6' do
      expect(NumberMax.function_of_search(arr)).to eq(6)
    end
  end
end
