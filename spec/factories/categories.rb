FactoryBot.define do
  factory :category do
    category_name { Faker::Music.genre }
  end
end
