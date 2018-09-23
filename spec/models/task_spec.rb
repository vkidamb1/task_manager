# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Task, type: :model do
  it { should have_many(:sub_tasks) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:details) }
  it {
    should validate_length_of(:name).is_at_least(2)
                                    .with_message('Name is too short, it should have minimum two characters')
  }
  it {
    should validate_length_of(:details).is_at_least(4)
                                       .with_message('Details are too short, it should have minimum four characters')
  }

  describe 'Validating scope in Task model' do
    context 'when the Task are created by the same user' do
      before(:each) do
        Task.destroy_all
        User.destroy_all
        User.create!(id: 1, email: 'vishnu@123.com', password: 'password')
        25.times do |i|
          Task.create!(id: (i + 1).to_s, name: "Vishnu#{i}",
                       details: "Details#{i}", access_control: 'public', user_id: 1)
        end
        25.times do |i|
          Task.create!(id: (i + 27).to_s, name: "Vishnu#{i}",
                       details: "Details#{i}", access_control: 'private', user_id: 1)
        end
      end

      it 'Should get all the records as this are
      all the public and private records of the same user' do
        expect(Task.user_acess_list(1).count).to eq 50
      end
    end

    context 'when the Task are created by the other users' do
      before(:each) do
        Task.destroy_all
        User.destroy_all
        User.create!(id: 1, email: 'vishnu@123.com', password: 'password')
        User.create!(id: 2, email: 'kidambi@123.com', password: 'password')
        10.times do |i|
          Task.create!(id: (i + 1).to_s, name: "Vishnu#{i}",
                       details: "Details#{i}", access_control: 'public', user_id: 1)
        end
        10.times do |i|
          Task.create!(id: (i + 11).to_s, name: "Vishnu#{i}",
                       details: "Details#{i}", access_control: 'private', user_id: 1)
        end
        10.times do |i|
          Task.create!(id: (i + 21).to_s, name: "Vishnu#{i}",
                       details: "Details#{i}", access_control: 'private', user_id: 2)
        end
        10.times do |i|
          Task.create!(id: (i + 31).to_s, name: "Vishnu#{i}",
                       details: "Details#{i}", access_control: 'private', user_id: 2)
        end
      end

      it 'Should ouput records of the first user' do
        expect(Task.user_acess_list(1).count).to eq 20
      end

      it 'Should give records of the second user' do
        expect(Task.user_acess_list(2).count).to eq 30
      end
    end
  end
end
