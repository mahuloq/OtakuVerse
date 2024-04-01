class AnimesController < ApplicationController
    before_action :set_anime, only: [:show, :update, :destroy,:add_genre_to_anime, :add_genres, :upload_image, :upload_cover_photo
    ]
    before_action :authenticate_request, only: [:create, :update, :destroy]

    def create
        anime = Anime.new(anime_params)

        if anime.save
            render json: anime, status: :created
        else
            render json: anime.errors, status: :unprocessable_entity
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
  genre = Genre.find(params[:genre_id])
    
  anime.add_genre(genre)
  render json: @anime, status: :ok 
end

def add_genres

  genre_ids = JSON.parse(request.body.read)['genre_ids']

  genre_ids.each do |genre_id|
    genre = Genre.find(genre_id)
    @anime.genres << genre
  end

  render json: @anime, status: :ok
end

def upload_image
  
 if params[:image] && @anime.images.attach(params[:image])
   render json: {message: "Image uploaded", url: rails_blob_url(@anime.images.last, only_path: false)},  status: :ok

 else
  render json: {messge: "Image upload failed"}, status: :unprocessable_entity
 end
end

def upload_cover_photo
 
  if params[:cover_photo] && @anime.cover_photo.attach(params[:cover_photo])
    render json: {message: "Cover photo uploaded", url: rails_blob_url(@anime.cover_photo, only_path: false)},  status: :ok
 
  else
   render json: {messge: "Cover photo upload failed"}, status: :unprocessable_entity
  end
 end

  private

  def set_anime
    @anime = Anime.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render json: { error: 'anime not found' }, status: :not_found
  end


  def anime_params
    params.permit(:english_title, :romanji_title, :start_air_date, :end_air_date, :age_rating, :number_of_episodes, :description, :season, :studio, :source, :duration, :cover_photo, :image, genre_ids: [])
  end
  

end
