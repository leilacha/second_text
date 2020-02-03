# frozen_string_literal: true

# Model for user contribution for creating a new product
class Contribution < ApplicationRecord
  STATUSES = %w[created approved declined].freeze
  validates :title, :author, :section, :category, :comment, :status, presence: true
  validates :status, inclusion: { in: STATUSES }, presence: true
  belongs_to :user
  before_save :check_products

  def check_products
    product = Product.where(title: title, author: author)
    raise "#{title} de #{author} existe déjà dans notre base de donnée" if product.any?
  end
end
