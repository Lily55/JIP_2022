require 'rails_helper'

RSpec.describe Number, type: :model do
  it "validates uniqueness" do
    Number.create(num: 1)
    expect(Number.create(num: 1).valid?).to eq false
  end
  it "validates integer" do
    expect(Number.create(num: 1.5).valid?).to eq false
  end
  it "validates positive" do
    expect(Number.create(num: -1).valid?).to eq false
  end
end
