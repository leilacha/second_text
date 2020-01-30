# frozen_string_literal: true

FactoryBot.define do
  factory :section do
    name { 'Books' }
    categories { ['Fiction', 'Non-fiction'] }
    status { 'active' }

    factory :section_with_products do
      after(:create) do |section|
        create_list(:product, 1, section: section)
      end
    end
  end
end
