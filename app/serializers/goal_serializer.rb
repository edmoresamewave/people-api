class GoalSerializer < ActiveModel::Serializer
  attributes :id, :title, :score

  belongs_to :person
end
