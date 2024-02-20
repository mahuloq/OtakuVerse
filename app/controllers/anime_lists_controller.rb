class AnimeListsController < ApplicationController


  def show
    @user = User.find_by(username: params[:username])
    @anime_list = AnimeList.where(user_id: @user.id).where(list_type: params[:status]) 
    render json: @anime_list
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
    anime_list = AnimeList.find_by(user_id: params[:user_id], anime_id: params[:anime_id])
    anime_list.update(category: params[:list_type]) if anime_list
  end

  def destroy
    anime_list = AnimeList.find_by(user_id: params[:user_id], anime_id: params[:anime_id], category: params[:list_type])
    anime_list.destroy if anime_list
    head :no_content
  end
  


  private

  def anime_list_params
    params.require(:anime_list).permit(:anime_id, :user_id, :list_type, :start_date, :end_date, :episodes_watched)
  end
end
