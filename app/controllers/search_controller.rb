# frozen_string_literal: true

# Recives search request from create cast component
class SearchController < ApplicationController
  def searchPerson
    name = params[:name]
    @results = Person.where('first_name LIKE ? OR last_name LIKE?', "%#{name}%", "%#{name}%")
    render json: @results
  end

  def searchGenre
    name = params[:name]
    @results = Genre.where('name LIKE ?', "%#{name}%")
    render json: @results
  end

  def searchAnimeByName
    name = params[:name]
    
    @results = Anime.where("english_title LIKE ? OR romanji_title LIKE ?", "#{name}%", "#{name}%")
    render json: @results
  end

  def searchAnimeLetter
    letter = params[:letter].upcase + '%'

    @animes = Anime.where("english_title LIKE ? OR romanji_title LIKE ?", letter, letter)

    render json: @animes
  end

  def searchAnimeByGenreId
   
    id = params[:id]  
    @genre = Genre.find(id)
    @results = @genre.animes
    render json: @results
  end

  def searchAnimeBySeason
    season = params[:season]

    @animes = Anime.where("season LIKE ?",season)
    render json: AnimeBlueprint.render(@animes, view: :seasonal_anime), status: :ok
  end
  
end
