class RatingsController < ApplicationController
  before_action :set_rating, only: [:update, :destroy]
  before_action :authenticate_request, only: [:create, :update, :destroy]

  def create
      rating = Rating.new(rating_params)
  
      if rating.save
          render json: rating, status: :created
      else
          render json:  rating.errors, status: :unprocessable_entity
    end
      end


def update 
  if @rating.update(rating_params)
    render json: @rating, status: :ok 
  else 
    render json: @rating.errors, status: :unprocessable_entity
  end
end


def destroy
  
if @rating.destroy
  head :no_content
else 
  render json: @rating.errors, status: :ok
end

end

private

def set_rating
  @rating = Rating.find(params[:id])
rescue ActiveRecord::RecordNotFound
  render json: { error: 'Rating not found' }, status: :not_found
end


def rating_params
params.permit(:anime_id,:user_id,:score)
end

end
