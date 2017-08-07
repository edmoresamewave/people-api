class GoalsController < ApplicationController
  def create
    goal =  Goal.create!(goals_params)
    render json: goal, status: :created
  end

  private
  def goals_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
