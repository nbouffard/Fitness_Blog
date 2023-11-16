FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number: 300) }
    user_id { 1 }
    post_id { 1 }
  end
end
