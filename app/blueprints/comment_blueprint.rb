# frozen_string_literal: true

class CommentBlueprint < Blueprinter::Base
identifier :id

view :normal do
  fields :content

  association :user, blueprint: UserBlueprint, view: :public_user
end

end
