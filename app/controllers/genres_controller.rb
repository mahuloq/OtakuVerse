class GenresController < ApplicationController
    before_action :set_genre, only: [:show, :update, :destroy]
    before_action :authenticate_request, only: [:create, :update, :destroy]
  
def index
  genre = Genre.all
  render json: GenreBlueprint.render(genre, view: :genre_names), status: :ok
end

    def create
        genre = Genre.new(genre_params)
    
        if genre.save
            render json: genre, status: :created
        else
            render json:  genre.errors, status: :unprocessable_entity
      end
        end
  
  
  def show
            render json: GenreBlueprint.render(@genre, view: :search_by_genre), status: :ok 
  end
  
  
  def update 
    if @genre.update(genre_params)
      render json: @genre, status: :ok 
    else 
      render json: @genre.errors, status: :unprocessable_entity
    end
  end
  
  
  def destroy
    
  if @genre.destroy
    head :no_content
  else 
    render json: @genre.errors, status: :ok
  end
  
  end
  
  
  
  private
    
  def set_genre
    @genre = Genre.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'genre not found' }, status: :not_found
  end
  
  
  def genre_params
  params.permit(:name, :description)
  end
  
  end
  
  
