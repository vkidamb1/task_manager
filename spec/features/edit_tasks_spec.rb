require 'rails_helper'

RSpec.feature "EditTasks", type: :feature do
  feature 'Editing a task' do
    scenario 'Editing of task by signing up the user' do
      create_task
      visit edit_task_path(id: 1)
      fill_in 'task_name', with: 'name'
      fill_in 'task_details', with: 'details'
      click_button 'Update Task'
      expect(page).to have_content('Task was successfully updated')
    end

    scenario 'Updating task without signing up the user' do
      visit edit_task_path(id: 1)
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end

    def create_task
   	  sign_up_with('valid@example.com', 'password')
      visit new_task_path
      fill_in 'task_name', with: 'name'
      fill_in 'task_details', with: 'details'
      click_button 'Save Task'
      expect(page).to have_content('Task was successfully created')
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
