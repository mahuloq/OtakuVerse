class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)

      render json: { token: token, user: UserBlueprint.render_as_hash(user,view: :profile) }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
