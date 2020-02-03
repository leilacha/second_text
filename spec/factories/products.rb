# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { 'Inceste' }
    author { 'Anais Nin' }
    release_date { '2020-01-01' }
    description { 'This is the journal of Anais Nin' }
    category { 'auto-biography' }
    section_id { create(:section).id }
  end
end
