# frozen_string_literal: true

# Model for products
class Product < ApplicationRecord
  validates :title, :author, :release_date, :description, :category, presence: true
  validates :title, uniqueness: { scope: :author,
                                  message: 'Le titre existe déjà pour cet auteur' }
  belongs_to :section
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
