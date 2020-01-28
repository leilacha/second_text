# frozen_string_literal: true

# Model for user
class User < ApplicationRecord
  validates :email, uniqueness: true
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
end
