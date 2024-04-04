require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'POST /users' do

    context 'with valid parameters' do
      it 'creates a new user' do
        user_attributes = FactoryBot.attributes_for(:user)
        post '/users', params: { user: user_attributes }
        expect(response).to have_http_status(:created)
        expect(User.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        post '/users', params: { user: { username: 'invalid' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(User.count).to eq(0)
      end

      it 'does not create a new user if username is blank' do
        post '/users', params: { user: { email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['username']).to include("can't be blank")
      end

      it 'does not create a new user if email is invalid' do
        post '/users', params: { user: { username: 'testuser', email: 'invalid_email', password: 'password', password_confirmation: 'password' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['email']).to include("is invalid")
      end

      it 'does not create a new user if password is too short' do
        post '/users', params: { user: { username: 'testuser', email: 'test@example.com', password: 'short', password_confirmation: 'short' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['password']).to include("is too short (minimum is 8 characters)")
      end

      it 'does not create a new user if password confirmation is blank' do
        post '/users', params: { user: { username: 'testuser', email: 'test@example.com', password: 'password', password_confirmation: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['password_confirmation']).to include("can't be blank")
      end

    end

  end

  describe 'DELETE /users/:id' do
    let!(:user) { FactoryBot.create(:user) }
    let(:token) {auth_token_for_user(user)}


    context 'when the user exists' do
      it 'deletes the user' do
        delete "/users/#{user.id}", headers: {Authorization: "Bearer #{token}"}
        expect(response).to have_http_status(:no_content)
        expect(User.count).to eq(0)
      end
    end

    context 'when the user does not exist' do
      it 'returns a not found error' do
        delete '/users/123'
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
