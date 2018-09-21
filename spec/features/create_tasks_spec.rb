# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'CreateTasks', type: :feature do
  feature 'Creating a new task' do
    scenario 'while creation of new task with signing up the user' do
      sign_up_with('valid@example.com', 'password')
      visit new_task_path
      fill_in 'task_name', with: 'name'
      fill_in 'task_details', with: 'details'
      click_button 'Create Task'
      expect(page).to have_content('Task was successfully created')
    end

    scenario 'Creation of new task without signing up the user' do
      visit new_task_path
      expect(page).to have_content('You need to sign in or sign up before continuing')
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
