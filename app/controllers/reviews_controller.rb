class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :authenticate_request, only: [:create, :update, :destroy]

  def create
      review = Review.new(review_params)
  
      if review.save
          render json: review, status: :created
      else
          render json:  review.errors, status: :unprocessable_entity
    end
      end


def show
  render json: @review, status: :ok 
end


def update 
  if @review.update(review_params)
    render json: @review, status: :ok 
  else 
    render json: @review.errors, status: :unprocessable_entity
  end
end


def destroy
  
if @review.destroy
  head :no_content
else 
  render json: @review.errors, status: :ok
end

end



private

def set_review
  @review = Review.find(params[:id])
rescue ActiveRecord::RecordNotFound
  render json: { error: 'review not found' }, status: :not_found
end


def review_params
params.permit(:content)
end

end

