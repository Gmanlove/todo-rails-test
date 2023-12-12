class Task < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true
  validates :due_date, presence: true
end