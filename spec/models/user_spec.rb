require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a unique username" do
    User.create(username: "Test")
    expect(User.create(username: "Test").valid?).to eq false
  end

  it "should have a unique email" do
    User.create(email: "test@gmail.com")
    expect(User.create(email: "test@gmail.com").valid?).to eq false
  end

  it "validates format" do
    expect(User.create(username: '-1+2ndjn 7 ', password: '1234').valid?).to eq false
  end

  it "validates format" do
    expect(User.create(email: 'title').valid?).to eq false
  end

  it "password should be minimum 6 characters" do
    expect(User.create(password_digest: 'title').valid?).to eq false
  end
end
