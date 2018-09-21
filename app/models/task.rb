class Task < ApplicationRecord
  belongs_to :user
  has_many :sub_tasks, dependent: :destroy

  validates :name, :details, :access_control, presence: true
  validates_length_of :name, minimum: 2 , message: 'Name is too short, it should have minimum two characters'
  validates_length_of :details, minimum: 4 , message: 'Details are too short, it should have minimum four characters'
end
