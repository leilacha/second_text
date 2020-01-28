# frozen_string_literal: true

# Model for section
class Section < ApplicationRecord
  validates :name, :status, presence: true
  validates :name, uniqueness: true
  has_many :products, dependent: :destroy
end
