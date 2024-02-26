module AuthHelpers
    def auth_token_for_user(user)
    JWT.encode({user_id: user.id}, Rails.application.credentials.secret_key_base)
    end
end