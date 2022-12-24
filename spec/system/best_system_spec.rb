require 'rails_helper'

RSpec.describe "application", type: :system do
    it "returns valid values after registration, login and logout" do
        # visit home_path
        # click_link "Регистрация"
        # expect(page).to have_current_path new_user_path

        # fill_in 'Логин', with: 'test_user'
        # fill_in 'Пароль', with: 'test_pass'
        # fill_in 'Почта', with: 'test@mail.ru'
        # fill_in 'Подтверждение пароля', with: 'test_pass'
        # click_button 'Сохранить'
        # expect(page).to have_current_path "/users/1"

        # click_link 'На главную'
        # expect(page).to have_current_path home_path

        visit home_path
        click_link 'Вход'
        expect(page).to have_current_path new_session_path

        # fill_in 'Логин', with: 'test_user'
        # fill_in 'Пароль', with: 'test_pass'
        # click_button 'Войти'
        # expect(page).to have_current_path '/'
        # expect(page).to have_content "Вы вошли на сайт"

        # click_button 'Выйти'
        # expect(page).to have_current_path home_path



        fill_in 'Логин', with: 'masha'
        fill_in 'Пароль', with: '1234567'
        click_button 'Войти'
        expect(page).to have_current_path '/'

        click_link 'Посмотреть профиль'
        expect(page).to have_current_path '/users/1'

        click_button 'Выйти'
        expect(page).to have_current_path home_path

    end
    
end