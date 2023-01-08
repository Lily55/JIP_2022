require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  it "should be maximum 140 characters" do
    expect(Post.create(title: Faker::Lorem.characters(number: 140)).valid?).to eq false
  end

  it "should have a unique title" do
    Post.create(title: "Test")
    expect(Post.create(title: "Test").valid?).to eq false
  end

  it "should have a spescial format" do
    expect(Post.create(title: '""""').valid?).to eq false
  end
end
