# frozen_string_literal: true

require 'rails_helper'
RSpec.describe TasksController, type: :controller do
  describe 'GET#index' do
    context 'Calling Index methods and noting down its responses' do
      before(:each) do
        get :index
      end

      it 'Should have a response status equals 200' do
        expect(response.status).to eq 200
      end

      it 'Should render index template' do
        expect(response).to render_template('index')
      end
    end
  end
end
