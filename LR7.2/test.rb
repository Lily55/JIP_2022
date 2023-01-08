# frozen_string_literal: true

require_relative 'logic'

RSpec.describe OneSymbol do
  it 'Has child OneSymbolWithShrift' do
    expect(OneSymbol >= OneSymbolWithShrift).to be true
  end
end

RSpec.describe OneSymbolWithShrift do
  it 'Has parent OneSymbol' do
    expect(OneSymbolWithShrift < OneSymbol).to be true
  end
end
