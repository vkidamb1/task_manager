# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Task, type: :model do
  it { should have_many(:sub_tasks) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:details) }
  it { should validate_length_of(:name).is_at_least(2)
  	.with_message('Name is too short, it should have minimum two characters')}
  it { should validate_length_of(:details).is_at_least(4)
  	.with_message('Details are too short, it should have minimum four characters')}
end
