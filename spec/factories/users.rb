FactoryBot.define do
  factory :user do
    email { "MyString" }
    username { "MyString" }
    is_admin { false }
  end
end
