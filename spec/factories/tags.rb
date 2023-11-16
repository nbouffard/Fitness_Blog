FactoryBot.define do
  factory :tag do
    tag_name { Faker::Movies::Hobbit.character }
    post_id { 1 }
  end
end
