# frozen_string_literal: true

# serializer for Comment
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_text, :user_id, :product_id
end
