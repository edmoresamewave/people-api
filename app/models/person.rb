class Person < ApplicationRecord
  has_many :goals, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def person_score
    return 0 if goals.empty?

    scores = self.goals.pluck(:score)
    total = scores.sum
    total.to_f/scores.count
  end
end
