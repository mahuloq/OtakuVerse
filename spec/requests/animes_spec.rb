require 'rails_helper'

RSpec.describe "Animes", type: :request do
  describe "GET /animes" do
    it "returns http success" do
      get "/animes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /animes/:id" do
    let(:anime) { create(:anime) }
    it "returns http success" do
   
      get "/animes/#{anime.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /animes" do
    
    it "creates a new anime" do
      anime_params = attributes_for(:anime)
      testTitle = anime_params[:english_title]
      
    
      expect {
        post "/animes", params: anime_params 
      }.to change(Anime, :count).by(1)
  
      expect(response).to have_http_status(:created)
      expect(Anime.last.english_title).to eq(testTitle)
      
    end
  end

  describe "PATCH /animes/:id" do
    let(:anime) {create(:anime) }
    it "updates an existing anime" do
     

      new_title = "Updated Anime"
      original = anime
      patch "/animes/#{original.id}", params: {english_title: new_title} 
      expect(response).to have_http_status(:success)
      expect(anime.reload.english_title).to eq(new_title)
    end
  end

  describe "DELETE /animes/:id" do
    let(:anime) {create(:anime) }
    it "deletes an existing anime" do
      
      test = anime
      expect {
        delete "/animes/#{test.id}"
      }.to change(Anime, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
