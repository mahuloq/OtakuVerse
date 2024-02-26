# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    


    view :normal do 
        fields :username
    end

    view :anime_list do 
        fields :username

        association :anime_lists, blueprint: AnimeListBlueprint, view: :anime_list
    end

    view :extended do
        fields :username, :created_at, :updated_at
    end
    
    
end
