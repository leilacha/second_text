# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    product { create(:product) }
    user { create(:user) }
  end
end
