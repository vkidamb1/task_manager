class Task < ApplicationRecord
  belongs_to :user
  has_many :sub_tasks, dependent: :destroy
end
