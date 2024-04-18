# frozen_string_literal: true

class ReviewBlueprint < Blueprinter::Base
identifier :id

  view :anime_page do 
    fields :content, :recommend

    # association :ratings, blueprint: RatingBlueprint, view: :normal

    association :user, blueprint: UserBlueprint, view: :public_user
  end

  view :review_page do
      fields :content, :recommend

      # association :ratings, blueprint: RatingBlueprint, view: :normal

      association :user, blueprint: UserBlueprint, view: :public_user
  end

  view :review_detailed do
    fields :content, :recommend

    # association :ratings, blueprint: RatingBlueprint, view: :normal

    association :comments, blueprint: CommentBlueprint, view: :normal

    association :user, blueprint: UserBlueprint, view: :public_user
  end
end
