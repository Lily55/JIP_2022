require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      username: "Username",
      email: "Email",
      password_digest: "Password Digest",
      status: "Status",
      admin: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/false/)
  end
end
