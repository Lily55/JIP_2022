# frozen_string_literal: true

require_relative 'func1'

RSpec.describe Func1 do
  describe '#func1' do
    let(:x) { 4 }
    let(:y) { 5 }
    it 'should be -0.033' do
      expect(Func1.func1(x, y).ceil(3)).to eq(-0.033)
    end
  end
end
