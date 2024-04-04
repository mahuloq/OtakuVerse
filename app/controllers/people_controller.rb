class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]
  before_action :authenticate_request, only: [:create, :update, :destroy]

    def create
        person = Person.new(person_params)
    
        if person.save
            render json: person, status: :created
        else
            render json:  person.errors, status: :unprocessable_entity
      end
        end

  def show
    render json: PersonBlueprint.render(@person, view: :person_profile), status: :ok 
  end

  
  def update 
    if @person.update(person_params)
      render json: @person, status: :ok 
    else 
      render json: @person.errors, status: :unprocessable_entity
    end
  end


def destroy
    
  if @person.destroy
    head :no_content
  else 
    render json: @person.errors, status: :ok
  end

end

  private

  def set_person
    @person = Person.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render json: { error: 'Person not found' }, status: :not_found
  end


def person_params
  params.permit(:first_name, :last_name, :bio, :birthday, :website, :alternate_names, :more, :language)
end

end
