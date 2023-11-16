FactoryBot.define do
  factory :social do
    link { Faker::Internet.url }
    user_id { 1 }
  end
end
