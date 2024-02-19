class AnimesController < ApplicationController
    before_action :set_anime, only: [:show, :update, :destroy]

    def create
        anime = Anime.new(anime_params)
    
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
    render json: @anime, status: :ok 
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



  private

  def set_anime
    @anime = Anime.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render json: { error: 'anime not found' }, status: :not_found
  end


def anime_params
  params.require(:anime).permit(:english_title, :romanji_title, :start_air_date, :end_air_date, :age_rating, :number_of_episodes, :description, :season, :studio, :source, :duration)
end

end
