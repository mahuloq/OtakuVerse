class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :authenticate_request, only: [:index, :show, :update, :destroy]

    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json:  user.errors.full_messages, status: :unprocessable_entity
      end
        end

  def index
    render json: User.all
  end

  def show
    render json: UserBlueprint.render(@user, view: :normal), status: :ok 
  end

  
  def update 
    if @user.update(user_params)
      render json: @user, status: :ok 
    else 
      render json: @user.errors, status: :unprocessable_entity
    end
  end


def destroy
    
  if @user.destroy
    head :no_content
  else 
    render json: @user.errors, status: :ok
  end

end



  private

  def set_user
    @user = User.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end


def user_params
  params.permit(:username, :email, :password, :password_confirmation)
end

end
