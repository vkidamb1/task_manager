# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'SignUp', type: :feature do
  feature 'Sign Up User' do
    scenario 'Signing up the user by confirming password' do
      sign_up_with 'valid@example.com', 'password'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'Signing up the user not confirming password' do
      sign_up_without_confirming 'valid@example.com', 'password'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    scenario 'with blank email' do
      sign_up_with '', 'password'
      expect(page).to have_content("Email can't be blank")
    end

    scenario 'with blank password' do
      sign_up_with 'valid@example.com', ''
      expect(page).to have_content("Password can't be blank")
    end

    def sign_up_without_confirming(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign up'
      end

    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
      end
  end
end
