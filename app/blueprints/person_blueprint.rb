# frozen_string_literal: true

class PersonBlueprint < Blueprinter::Base
    identifier :id

   #Provides person info, pulls cast and crew info, which pulls anime info. 
    view :person_profile do 
        fields :first_name, :last_name, :bio, :birthday, :website, :alternate_names, :more

        association :cast_and_crews, blueprint: CastAndCrewBlueprint, view: :person_profile
    
    end

# May be detailed version, currently not needed
    # view :cast_crew_detailed do 
    #     fields :first_name, :last_name, :language
    # end

#Cut down person info for main anime page. 
    view :cast_crew do 
        fields :first_name, :last_name, :language

    end
end
