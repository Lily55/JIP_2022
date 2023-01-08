require 'rails_helper'

RSpec.describe User, type: :model do
  it "validates uniqueness" do
    User.create(username: 'taro')
    expect(User.create(username: 'taro').valid?).to eq false
  end
  it "validates format" do
    expect(User.create(username: '-1+2ndjn 7 ', password: '1234').valid?).to eq false
  end
end
