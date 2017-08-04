class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :person_score
  has_many :goals

  def person_score
    return 0 if object.goals.empty?

    scores = object.goals.pluck(:score)
    total = scores.sum
    total/scores.count
  end
end
