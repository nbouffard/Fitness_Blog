FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 50) }
    content { Faker::Lorem.characters(number: 150) }
    category { 'one' }
    user_id { 1 }
  end
end
