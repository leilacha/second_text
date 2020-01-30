# frozen_string_literal: true

FactoryBot.define do
  factory :contribution do
    title { 'Crépuscule du tourment' }
    author { 'Léonora Miano' }
    section { 'Livres' }
    category { 'Fiction' }
    comment { 'C\'est mon livre préféré' }
    status { 'approved' }
    user_id { (create :user).id }
  end
end
