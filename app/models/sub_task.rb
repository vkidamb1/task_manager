class SubTask < ApplicationRecord
  belongs_to :task
  validates :content, presence: true
  validates_length_of :content, minimum: 4, message: 'Content is too short, it should have minimum four characters'
end
