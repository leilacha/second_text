# frozen_string_literal: true

# serializer for Section
class SectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :categories
end
