# frozen_string_literal: true

# Cast and crew blueprint for serializing data
class CastAndCrewBlueprint < Blueprinter::Base
  identifier :id

  view :anime_page do 
    fields :role, :character
       association :person, blueprint: PersonBlueprint, view: :cast_crew
    end

 # May be detailed version, but seems anime_page will just be used twice, with different filter options between the main page, and the staff page.    
# view :anime_page_detailed do
#     fields :role, :character

# association :person, blueprint: PersonBlueprint, view: :cast_and_crew_detailed
#     end

    view :animeCastEdit do
        fields :role, :character

        association :person, blueprint: PersonBlueprint, view: :cast_crew
    end

    view :person_profile do 
        fields :role, :character

        association :anime, blueprint: AnimeBlueprint, view: :person_profile
    end
end
