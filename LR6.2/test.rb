# frozen_string_literal: true

require_relative 'logic'

RSpec.describe Integral do
  describe '#integral' do
    it 'should be < 0.431 and >0.428' do
      expect(Integral.count).to be < 0.431
      expect(Integral.count).to be > 0.428
    end
  end
end
