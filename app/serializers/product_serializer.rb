# frozen_string_literal: true

# serializer for Product
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :release_date, :description
end
