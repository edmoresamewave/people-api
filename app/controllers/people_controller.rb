class PeopleController < ApplicationController
  def index
    @people = Person.all
    render json: @people, root: true,
           include: {goals: {except: [:created_at, :updated_at, :person_id]}},
           methods: :person_score,
           except: [:created_at, :updated_at],
           status: :ok
  end

  def create
    @person =  Person.create!(people_params)
    render json: @person, status: :created
  end

  private
  def people_params
    params.permit(:first_name, :last_name)
  end
end
