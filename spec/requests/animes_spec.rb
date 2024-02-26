require 'rails_helper'

RSpec.describe "Animes", type: :request do

 #Get all anime 
  describe "GET /animes" do
    it "returns http success" do
      get "/animes"
      expect(response).to have_http_status(:success)
    end
  end


 #Show specific anime 
  describe "GET /animes/:id" do
    let(:anime) { create(:anime) }
    it "returns http success" do
   
      get "/animes/#{anime.id}"
      expect(response).to have_http_status(:success)
    end
  end

 #Create new Anime in database 
  describe "POST /animes" do
    let!(:user) { FactoryBot.create(:user) }
    let(:token) {auth_token_for_user(user)}

    it "creates a new anime" do
      anime_params = attributes_for(:anime)
      testTitle = anime_params[:english_title]
      
    
      expect {
        post "/animes", params: anime_params, headers: {Authorization: "Bearer #{token}"} 
      }.to change(Anime, :count).by(1)
  
      expect(response).to have_http_status(:created)
      expect(Anime.last.english_title).to eq(testTitle)
      
    end
  end

  describe "PATCH /animes/:id" do
    let(:anime) {create(:anime) }
    let!(:user) { FactoryBot.create(:user) }
    let(:token) {auth_token_for_user(user)}

    it "updates an existing anime" do
     

      new_title = "Updated Anime"
      original = anime
      patch "/animes/#{original.id}", params: {english_title: new_title}, headers: {Authorization: "Bearer #{token}"}  
      expect(response).to have_http_status(:success)
      expect(anime.reload.english_title).to eq(new_title)
    end
  end

  describe "DELETE /animes/:id" do
    let(:anime) {create(:anime) }
    let!(:user) { FactoryBot.create(:user) }
    let(:token) {auth_token_for_user(user)}

    it "deletes an existing anime" do
      
      test = anime
      expect {
        delete "/animes/#{test.id}", headers: {Authorization: "Bearer #{token}"} 
      }.to change(Anime, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
