class PersonsController < ApplicationController
  before_action :setup_person_manager
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    render json: @person_manager.to_json, status: :ok
  end

  def create
    @person = @person_factory.build params[:person]
    @person_manager.set_person @person
    @person_manager.save_persons
    render json: @person, status: :created
  end

  def show
    render json: @person, status: :ok
  end

  def update
    @person.name = params[:name]
    @person.email = params[:email]
    @person.date_of_birth = params[:date_of_birth]
    @person.salary = params[:salary]
    @person_manager.set_person(@person)
    @person_manager.save_persons
    head :no_content
  end

  def destroy
    @person_manager.remove_person(@person)
    @person_manager.save_persons
    head :no_content
  end

  def setup_person_manager
    @person_manager = PersonManager.new(PersonJsonApiStore.new)
    @person_factory = PersonFactory.new(@person_manager.max_id)
  end

  def set_person
    @person = @person_manager.get_person(params[:id].to_i)
  end
end
