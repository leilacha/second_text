# frozen_string_literal: true

# serializer for Like
class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id
end
