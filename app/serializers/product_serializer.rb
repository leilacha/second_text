# frozen_string_literal: true

# serializer for Product
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :release_date, :description, :likes_count
  has_many :likes

  def likes_count
    object.likes.count
  end
end
