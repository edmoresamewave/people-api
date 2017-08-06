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

  def show
    @person = Person.find_by_id(params[:id])
    if @person.nil?
      render plain: '404 Not found', status: 404
    else
      render json: @person,
             include: {goals: {except: [:created_at, :updated_at, :person_id]}},
             methods: :person_score,
             except: [:created_at, :updated_at],
             status: :ok
    end
  end

  def update
    @person = Person.find_by_id(params[:id])
    @person.update_attributes(people_params)
    render json: @person,
          include: {goals: {except: [:created_at, :updated_at, :person_id]}},
          methods: :person_score,
          except: [:created_at, :updated_at],
          status: :ok
  end

  def destroy
    @person = Person.find_by_id(params[:id])
    @person.destroy
    render json: {}, status: :no_content
  end

  private
  def people_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:first_name, :last_name])
  end
end
