require 'rails_helper'

RSpec.describe AnimeListsController, type: :request do
 
  
  describe 'GET #show' do
    let(:user) { create(:user, username: 'test_user') }
    let(:anime_list) {create(:anime_list, user: user) }
    let(:token) {auth_token_for_user(user)}
  

    it 'returns a success response' do
      get anime_list_path(username: user.username, list_type: 'completed'), headers: {Authorization: "Bearer #{token}"}
      expect(response).to be_successful
    end
  end



  describe 'POST #create' do
    let(:user) { create(:user) }
  let(:anime) { create(:anime) }
  let(:token) {auth_token_for_user(user)}

    context 'with valid parameters' do
      
      before do

        list_attributes = attributes_for(:anime_list, list_type: :completed,user_id: user.id, anime_id: anime.id)
        
        post anime_lists_path, params: list_attributes, headers: {Authorization: "Bearer #{token}"}
        
      end

      it 'creates a new anime list' do
        expect(response).to be_successful
      end

      it 'renders a JSON response with the new anime list' do
        expect(response).to have_http_status(:created)
        
        expect(response.body).to eq(AnimeList.last.to_json)
      end
    end
  end

    context 'with invalid parameters' do
      let(:token) {auth_token_for_user(user)}
      let(:user) { create(:user) }
      it 'renders a JSON response with errors for the new anime list' do
        post anime_lists_path, params: { invalid_attribute: 'invalid value' }, headers: {Authorization: "Bearer #{token}"}
        expect(response).to have_http_status(:unprocessable_entity)
       
      end
    end
  end

  describe 'PUT #update' do
    let(:anime_list) {create(:anime_list, list_type: "completed") }
    let(:new_list_type) { 'watching' }
    let(:user) { create(:user) }
    let(:token) {auth_token_for_user(user)}

    context 'with valid parameters' do
      it 'updates the requested anime list' do
       list = anime_list
      
        put "/anime_lists/#{list.id}", params:{ list_type: new_list_type }, headers: {Authorization: "Bearer #{token}"} 
        expect(response).to have_http_status(:ok)
        list.reload

        expect(AnimeList.last.list_type).to eq(new_list_type)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:anime_list) { FactoryBot.create(:anime_list, user: user) }
    let(:token) {auth_token_for_user(user)}

    it 'destroys the requested anime list' do
      list = anime_list
      
      delete "/anime_lists/#{list.id}", headers: {Authorization: "Bearer #{token}"}
      expect(response).to have_http_status(:no_content)
      expect(AnimeList.find_by(id: anime_list.id)).to be_nil
    end
  end

