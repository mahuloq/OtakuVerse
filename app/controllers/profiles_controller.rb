class ProfilesController < ApplicationController
  before_action :set_profile, only: [:update, :destroy]
  before_action :authenticate_request, only: [:create, :update, :destroy]

  def create
      profile = Profile.new(profile_params)
  
      if profile.save
          render json: profile, status: :created
      else
          render json:  profile.errors, status: :unprocessable_entity
    end
      end


def update 
  if @profile.update(profile_params)
    render json: @profile, status: :ok 
  else 
    render json: @profile.errors, status: :unprocessable_entity
  end
end


def destroy
  
if @profile.destroy
  head :no_content
else 
  render json: @profile.errors, status: :ok
end

end

private

def set_profile
  @profile = Profile.find(params[:id])
rescue ActiveRecord::RecordNotFound
  render json: { error: 'Profile not found' }, status: :not_found
end


def profile_params
params.permit(:user_id, :profile_picture, :bio, :favorites)
end

end
