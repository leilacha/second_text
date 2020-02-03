# frozen_string_literal: true

FactoryBot.define do
  factory :user_admin do
    email { 'lei@lei.com' }
    username { 'leilacha' }
    is_admin { true }
  end

  factory :user do
    email { 'babar@elephant.com' }
    username { 'babarlekhey' }
    is_admin { true }
  end
end
