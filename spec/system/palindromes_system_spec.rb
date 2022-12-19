require 'rails_helper'

RSpec.describe "application", type: :system do
  it "returns valid values after registration and login" do
    visit root_path
    click_link 'Регистрация'
    expect(page).to have_current_path new_user_path

    fill_in 'Username', with: 'test_user'
    fill_in 'Password', with: 'test_pass'
    fill_in 'Password confirmation', with: 'test_pass'
    click_button 'Create User'
    expect(page).to have_current_path "/users/1"

    click_link 'Go to login'
    expect(page).to have_current_path root_path
    
    fill_in 'Username', with: 'test_user'
    fill_in 'Password', with: 'test_pass'
    click_button 'Login'
    expect(page).to have_current_path palindromes_input_path

    fill_in "num", with: 36
    click_button "Выполнить"

    expect(page).to have_content 'Вы ввели число: 36'
  end

  it "doesn't allow non-logged in users to calculate values" do
    visit palindromes_input_path
    fill_in "num", with: 36
    click_button 'Выполнить'
    expect(page).to have_current_path '/palindromes/view?num=36&commit=%D0%92%D1%8B%D0%BF%D0%BE%D0%BB%D0%BD%D0%B8%D1%82%D1%8C'
  end
end