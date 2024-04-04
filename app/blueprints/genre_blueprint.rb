# frozen_string_literal: true

class GenreBlueprint < Blueprinter::Base
  
  identifier :id

  view :genre_names do 
      fields :name
  end

view :search_by_genre do
fields :name, :description

association :animes, blueprint: AnimeBlueprint, view: :search_by_genre

end

  view :genre_detailed do 
      fields :name, :description
  end
end

