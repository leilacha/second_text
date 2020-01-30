# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    comment_text { 'Cette oeuvre m\'a bouleversée' }
    product { create(:product) }
    user { create(:user) }
  end
end
