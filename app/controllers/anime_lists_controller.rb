class AnimeListsController < ApplicationController
  before_action :authenticate_request, only: [:create, :update, :destroy,:get_anime_list]

  def show
    @user = User.find_by(username: params[:username])
    @anime_list = AnimeList.where(user_id: @user.id)
    render json: @anime_list
  end

  def get_anime_list
    anime_list = AnimeList.find_by(user_id: @current_user.id, anime_id: params[:anime_id])

    render json: anime_list
  end


  def create
    
    @anime_list = AnimeList.new(anime_list_params)
   
    if @anime_list.save
      render json: @anime_list, status: :created
    else
      render json: @anime_list.errors, status: :unprocessable_entity
    end
  end

  def update
    anime_list = AnimeList.find(params[:id])
    anime_list.assign_attributes(anime_list_params) if anime_list

if anime_list.save
  render json: anime_list, status: :ok
else
  render json: anime_list.errors, status: :unprocessable_entity
  end
end

  def destroy
    anime_list = AnimeList.find(params[:id])
    anime_list.destroy if anime_list
    head :no_content
    puts "anime destroyed"
  end
  

  private

  def anime_list_params
    params.permit(:anime_id, :user_id, :list_type, :start_date, :end_date, :episodes_watched,rating_attributes: [:score])
  end
  # def anime_list_params
  #   params.require(:anime_list).permit(:anime_id, :user_id, :list_type, :start_date, :end_date, :episodes_watched,rating_attributes: [:score])
  # end
end
