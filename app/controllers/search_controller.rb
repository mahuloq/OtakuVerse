# frozen_string_literal: true

# Recives search request from create cast component
class SearchController < ApplicationController
  def searchPerson
    name = params[:name]
    @results = Person.where('first_name LIKE ? OR last_name LIKE?', "%#{name}%", "%#{name}%")
    render json: @results
  end
end
