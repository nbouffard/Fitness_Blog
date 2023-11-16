FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 50) }
    content { Faker::Lorem.characters(number: 1550) }
    user_id { 1 }
    category_id { 1 }
  end
end
