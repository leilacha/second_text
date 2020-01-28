# frozen_string_literal: true

FactoryBot.define do
  factory :contribution do
    title { 'MyString' }
    author { 'MyString' }
    section { 'MyString' }
    category { 'MyString' }
    comment { 'MyString' }
    status { 'MyString' }
    product_id { 'MyString' }
  end
end
