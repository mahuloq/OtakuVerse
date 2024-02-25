# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id
    
association :anime_lists, blueprint: AnimeListBlueprint, view: :normal

    view :normal do 
        fields :username
    end

    view :extended do
        fields :username, :created_at, :updated_at
    end
end
