# frozen_string_literal: true

# Model for user contribution for creating a new product
class Contribution < ApplicationRecord
  belongs_to :user
end
