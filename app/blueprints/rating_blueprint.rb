# frozen_string_literal: true

class RatingBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :score
  end

  view :anime_list do
    fields :score
  end
end
