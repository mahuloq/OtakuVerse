# frozen_string_literal: true

# Blueprint for retreving user profile info
class ProfileBlueprint < Blueprinter::Base
  identifier :id

  view :profile do
    fields :profile_photo_url, :bio, :favorites

    association :user, blueprint: UserBlueprint, view: :anime_list
  end
end
