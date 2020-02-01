# frozen_string_literal: true

Section.create(
  status: 'active',
  name: 'Livres'
)

10.times do
  Product.create(
    title: Faker::Book.title,
    author: Faker::FunnyName.name,
    description: Faker::Hipster.paragraphs,
    release_date: Faker::Date.between(from: 200.years.ago, to: 1.year.ago),
    section_id: Section.find_by(name: 'Livres').id,
    category: %w[fiction non-fiction essay].sample
  )
end

10.times do
  User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.username
  )
end
