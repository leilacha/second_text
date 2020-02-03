# frozen_string_literal: true

# Model for comments
class Comment < ApplicationRecord
  validates :comment_text, presence: true
  belongs_to :product
  belongs_to :user
end
