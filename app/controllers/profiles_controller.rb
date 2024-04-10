# frozen_string_literal: true

# require 'uri_utils'

# Manages creating, retriving and storing profile info
class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show update destroy]
  before_action :authenticate_request, only: %i[create update destroy]

  def create
    profile = Profile.new(profile_params)
    if profile.save
      render json: profile, status: :created
    else
      render json: profile.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: ProfileBlueprint.render(@profile, view: :profile), status: :ok 
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

  def upload_profile_photo
 
    if params[:profile_photo] && @profile.profile_photo.attach(params[:profile_photo])
      render json: {message: "profile photo uploaded", url: rails_blob_url(@profile.profile_photo, only_path: false)},  status: :ok
   
    else
     render json: {messge: "Profile photo upload failed"}, status: :unprocessable_entity
    end
   end

  private

  def set_profile
  
    # decoded_username = URIUtils.decode_uri(params[:username])
    
    user = User.find_by(username: params[:username])

  if user
    @profile = user.profile || user.create_profile
  else
    render json: { error: 'User not found' }, status: :not_found
  end
  end

  def profile_params
    params.permit(:user_id, :profile_picture, :bio, :favorites, :profile_photo)
  end
end
