require 'rails_helper'

RSpec.describe AnimeListsController, type: :request do
  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user, username: 'test_user') }
    let(:anime_list) { FactoryBot.create(:anime_list, user: user) }
    it 'returns a success response' do
      get anime_list_path(username: user.username, list_type: 'completed'), headers: valid_headers
      expect(response).to be_successful
    end
  end

  # describe 'POST #create' do
  #   let(:valid_attributes) { FactoryBot.attributes_for(:anime_list) }

  #   context 'with valid parameters' do
  #     it 'creates a new anime list' do
  #       expect {
  #         post anime_lists_path, params: { anime_list: valid_attributes }, headers: valid_headers
  #       }.to change(AnimeList, :count).by(1)
  #     end

  #     it 'renders a JSON response with the new anime list' do
  #       post anime_lists_path, params: { anime_list: valid_attributes }, headers: valid_headers
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json')
  #       expect(response.location).to eq(anime_list_url(AnimeList.last))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'renders a JSON response with errors for the new anime list' do
  #       post anime_lists_path, params: { anime_list: { invalid_attribute: 'invalid value' } }, headers: valid_headers
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe 'PUT #update' do
  #   let(:user) { FactoryBot.create(:user) }
  #   let(:anime_list) { FactoryBot.create(:anime_list, user: user) }
  #   let(:new_list_type) { 'watching' }

  #   context 'with valid parameters' do
  #     it 'updates the requested anime list' do
  #       put anime_list_path(anime_list), params: { anime_list: { list_type: new_list_type } }, headers: valid_headers
  #       anime_list.reload
  #       expect(anime_list.list_type).to eq(new_list_type)
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   let(:user) { FactoryBot.create(:user) }
  #   let(:anime_list) { FactoryBot.create(:anime_list, user: user) }

  #   it 'destroys the requested anime list' do
  #     delete anime_list_path(anime_list), headers: valid_headers
  #     expect(response).to have_http_status(:no_content)
  #     expect(AnimeList.find_by(id: anime_list.id)).to be_nil
  #   end
  # end
end
