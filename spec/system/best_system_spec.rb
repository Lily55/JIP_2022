require 'rails_helper'

RSpec.describe "application", type: :system do
    it "returns valid values after registration, login and logout" do
        visit root_path
        click_link "Registration"
        expect(page).to have_current_path "/en/users/new"

        fill_in 'Username', with: 'test_user'
        fill_in 'Email', with: 'test@mail.ru'
        fill_in 'Password', with: 'test_pass'
        fill_in 'Password confirmation', with: 'test_pass'
        click_button 'Save'
        expect(page).to have_current_path "/en/users/1"

        expect(page).to have_content 'admin'

        expect(page).to have_content 'Look profile'

        click_link "To Users List"
        expect(page).to have_current_path "/en/users"

        click_link 'Home'
        expect(page).to have_current_path "/en/home"

        click_link 'News'
        expect(page).to have_current_path "/en/posts"

        click_link 'Add news'
        expect(page).to have_current_path "/en/posts/new"

        fill_in "Title", with: "Test"
        fill_in "Summary", with: "Testing"
        fill_in "Body", with: "Testing body"
        click_button "Save"
        expect(page).to have_current_path "/en/posts/1"

        click_link "Back to other news"
        expect(page).to have_current_path "/en/posts"

        click_link 'Add news'
        expect(page).to have_current_path "/en/posts/new"

        fill_in "Title", with: "Test2"
        fill_in "Summary", with: "Testing2"
        fill_in "Body", with: "Testing body2"
        select "full", :from => "For whom?"
        click_button "Save"
        expect(page).to have_current_path "/en/posts/2"

        click_link "Back to other news"
        expect(page).to have_current_path "/en/posts"

        expect(page).to have_content 'Test'
        expect(page).to have_content 'Test2'

        fill_in "Search...", with: "Test2"
        click_button "Find"
        expect(page).to have_content 'Test2'

        click_link "Read more..."
        expect(page).to have_current_path "/en/posts/2"

        click_link "Edit"
        expect(page).to have_current_path "/en/posts/2/edit"

        fill_in "Title", with: "Test23"
        click_button "Save"
        expect(page).to have_current_path "/en/posts/2"
        expect(page).to have_content 'Post was successfully updated!'

        click_link "Back to other news"
        expect(page).to have_current_path "/en/posts"

        click_link "Look profile"
        expect(page).to have_current_path "/en/users/1"

        click_button "Log out"
        expect(page).to have_current_path "/en/home"

        click_link "Log in"
        expect(page).to have_current_path "/en/session/new"

        fill_in 'Username', with: 'test_user'
        fill_in 'Password', with: 'test_pass'
        click_button "Log in"
        expect(page).to have_current_path "/en"
        expect(page).to have_content 'You logged in!'

        click_link "Look profile"
        expect(page).to have_current_path "/en/users/1"

        click_button "Log out"
        expect(page).to have_current_path "/en/home"

        click_link "Registration"
        expect(page).to have_current_path "/en/users/new"

        fill_in 'Username', with: 'test_user2'
        fill_in 'Email', with: 'test2@mail.ru'
        fill_in 'Password', with: 'test_pass'
        fill_in 'Password confirmation', with: 'test_pass'
        click_button 'Save'
        expect(page).to have_current_path "/en/users/2"
        expect(page).to have_content 'full'

        click_link 'News'
        expect(page).to have_current_path "/en/posts"

        fill_in "Search...", with: "Test23"
        click_button "Find"
        expect(page).to have_content 'Test23'

        click_link "Read more..."
        expect(page).to have_current_path "/en/posts/2"

        expect(page).not_to have_content 'Edit'

        click_link "Back to other news"
        expect(page).to have_current_path "/en/posts"

        click_link 'Add news'
        expect(page).to have_current_path "/en/posts/new"

        fill_in "Title", with: "Test3"
        fill_in "Summary", with: "Testing3"
        fill_in "Body", with: "Testing body3"
        select "baby&full", :from => "For whom?"
        click_button "Save"
        expect(page).to have_current_path "/en/posts/3"

        click_link "Look profile"
        expect(page).to have_current_path "/en/users/2"
        expect(page).not_to have_content "To Users List"

        click_button "Log out"
        expect(page).to have_current_path "/en/home"

        click_link "Registration"
        expect(page).to have_current_path "/en/users/new"

        fill_in 'Username', with: 'test_user3'
        fill_in 'Email', with: 'test3@mail.ru'
        fill_in 'Password', with: 'test_pass'
        fill_in 'Password confirmation', with: 'test_pass'
        click_button 'Save'
        expect(page).to have_current_path "/en/users/3"
        expect(page).to have_content 'baby'
        expect(page).not_to have_content 'To Users List'

        click_link 'News'
        expect(page).to have_current_path "/en/posts"
        expect(page).not_to have_content 'Test23'

        click_link 'Add news'
        expect(page).to have_current_path "/en/posts/new"

        fill_in "Title", with: "Test4"
        fill_in "Summary", with: "Testing4"
        fill_in "Body", with: "Testing body4"
        select "baby&full", :from => "For whom?"
        click_button "Save"
        expect(page).to have_current_path "/en/posts/4"

        click_link 'News'
        expect(page).to have_current_path "/en/posts"

        click_link "Look profile"
        expect(page).to have_current_path "/en/users/3"

        click_button "Log out"
        expect(page).to have_current_path "/en/home"

        click_link "Registration"
        expect(page).to have_current_path "/en/users/new"

        fill_in 'Username', with: 'test_user4'
        fill_in 'Email', with: 'test4@mail.ru'
        fill_in 'Password', with: 'test_pass'
        fill_in 'Password confirmation', with: 'test_pass'
        click_button 'Save'
        expect(page).to have_current_path "/en/users/4"
        expect(page).to have_content 'observer'
        expect(page).not_to have_content 'To Users List'

        click_link 'News'
        expect(page).to have_current_path "/en/posts"
        expect(page).not_to have_content 'Test23'
        expect(page).not_to have_content 'Test4'

        click_link 'Add news'
        expect(page).to have_current_path "/en/posts/new"

        fill_in "Title", with: "Test5"
        fill_in "Summary", with: "Testing5"
        fill_in "Body", with: "Testing body5"
        select "all", :from => "For whom?"
        click_button "Save"
        expect(page).to have_current_path "/en/posts/5"

        click_link "Look profile"
        expect(page).to have_current_path "/en/users/4"

        click_button "Log out"
        expect(page).to have_current_path "/en/home"

        click_link 'News'
        expect(page).to have_current_path "/en/posts"
        expect(page).not_to have_content 'Test23'
        expect(page).not_to have_content 'Test4'
        expect(page).not_to have_content 'Add news'

        click_link "Log in"
        expect(page).to have_current_path "/en/session/new"

        click_link "Forgot password?"
        expect(page).to have_current_path "/en/password_reset/new"

    end
    
end