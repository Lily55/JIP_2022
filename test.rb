# frozen_string_literal: true

require './logic'

RSpec.describe SortAsHash do
  describe '#sort_hash' do
    let(:last) { (100..200).select(&:odd?).sample }
    let(:first) { (1..5).select(&:even?).sample }
    let(:second) { (6..12).select(&:odd?).sample }
    let(:third) { (23..50).select(&:even?).sample }

    it 'should be another' do
      arr = [last, third, second, first]
      hash = { first => 3, second => 2, third => 1, last => 0 }
      expect(SortAsHash.sort_hash(arr)).to eq(hash)
    end
  end
end
