class AnimesController < ApplicationController
    before_action :set_anime, only: [:show, :update, :destroy,:add_genre_to_anime]
    before_action :authenticate_request, only: [:create, :update, :destroy]

    def create
        anime = Anime.new(anime_params)
        debugger
    # anime.genres << anime_params.genre_ids
        if anime.save
            render json: anime, status: :created
        else
            render json:  anime.errors, status: :unprocessable_entity
      end
        end

  def index
    render json: Anime.all
  end

  def show
   render json: AnimeBlueprint.render(@anime, view: :anime_page), status: :ok 
  end

  
  def update 
    if @anime.update(anime_params)
      render json: @anime, status: :ok 
    else 
      render json: @anime.errors, status: :unprocessable_entity
    end
  end


def destroy
    
  if @anime.destroy
    head :no_content
  else 
    render json: @anime.errors, status: :ok
  end

end

def add_genre_to_anime
  genre_ids = JSON.parse(request.body.read)['genre_ids']
  
  genre_ids.each do |genre_id|
    genre = Genre.find(genre_id)
    @anime.genres << genre
  end
  render json: @anime, status: :ok 
end


  private

  def set_anime
    @anime = Anime.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render json: { error: 'anime not found' }, status: :not_found
  end


def anime_params
  params.permit(:english_title, :romanji_title, :start_air_date, :end_air_date, :age_rating, :number_of_episodes, :description, :season, :studio, :source, :duration, genre_ids: [])
end

end
