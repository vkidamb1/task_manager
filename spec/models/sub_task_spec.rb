# frozen_string_literal: true

require 'rails_helper'
RSpec.describe SubTask, type: :model do
  it { should belong_to(:task) }
end
