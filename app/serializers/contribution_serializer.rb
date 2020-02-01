# frozen_string_literal: true

# serializer for Contribution
class ContributionSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :comment, :section, :category, :status
end
