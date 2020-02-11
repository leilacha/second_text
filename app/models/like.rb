# frozen_string_literal: true

# Model for lieks for products
class Like < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:product_id]
end
