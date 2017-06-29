class Goal < ApplicationRecord
  belongs_to :person

  validates :title, presence: true
  validates :score, :inclusion => 1..10
end
