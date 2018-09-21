# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Task, type: :model do
  it { should have_many(:sub_tasks) }
  it { should belong_to(:user) }
end
