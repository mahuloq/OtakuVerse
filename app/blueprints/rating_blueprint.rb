# frozen_string_literal: true

class RatingBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :rating
  end
end
