class PeopleController < ApplicationController
  def index
    @people = Person.all
    render json: @people, include: :goals, methods: :person_score, status: :ok

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
