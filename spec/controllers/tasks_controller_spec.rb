# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET#index' do
    def setup
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in User.create(id: 1, email: "vishnu@123.com", password: "password")
    end
    context 'Calling Index and noting down its responses when user is not logged in' do
      before(:each) do
        get :index
      end

      it 'Should have a response status equals 302' do
        expect(response.status).to eq 302
      end

      it 'Should redirect to login page' do
        expect(response).to redirect_to ('/users/sign_in')
      end
    end
    context 'Calling Index and noting down its responses when user is logged in' do
      before(:each) do
        User.destroy_all
        setup
        get :index
      end

      it 'Should have a response status equals 200' do
        expect(response.status).to eq 200
      end

      it 'Should render index template' do
        expect(response).to render_template("index")
      end
    end
    context 'Calling Index and noting down its responses when user is logged in' do
      before(:each) do
        User.destroy_all
        Task.destroy_all
        setup
        # 55.times do |i|
        #   Task.create(id: 1,name: "Vishnu#{i}", details: "Details#{i}", access_control: "public")
        # end
        get :index
      end

      it 'Should have a response status equals 302' do
        #binding.pry
        expect(assigns(:tasks)).not_to be_nil
      end
    end
  end
end
