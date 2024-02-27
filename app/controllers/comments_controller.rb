class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]
    before_action :authenticate_request, only: [:create, :update, :destroy]

    def create
        comment = Comment.new(comment_params)
    
        if comment.save
            render json: comment, status: :created
        else
            render json:  comment.errors, status: :unprocessable_entity
      end
        end

  def show
    render json: CommentBlueprint.render(@comment, view: :comment), status: :ok 
  end

  
  def update 
    if @comment.update(comment_params)
      render json: @comment, status: :ok 
    else 
      render json: @comment.errors, status: :unprocessable_entity
    end
  end


def destroy
    
  if @comment.destroy
    head :no_content
  else 
    render json: @comment.errors, status: :ok
  end

end

  private

  def set_comment
    @comment = Comment.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render json: { error: 'Comment not found' }, status: :not_found
  end


def comment_params
  params.permit(:content)
end

end
