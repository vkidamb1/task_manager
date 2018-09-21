# frozen_string_literal: true

require 'rails_helper'
RSpec.describe SubTask, type: :model do
  it { should belong_to(:task) }
  it { should validate_presence_of(:content) }
  it { should validate_length_of(:content).is_at_least(4)
  	.with_message('Content is too short, it should have minimum four characters')}
end
