# frozen_string_literal: true

class AnimeListBlueprint < Blueprinter::Base

    identifier :id
    
    view :normal do
        fields :anime_id, :list_type, :start_date, :end_date, :episodes_watched
    end
end
