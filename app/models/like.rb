# frozen_string_literal: true

# Model for lieks for products
class Like < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
