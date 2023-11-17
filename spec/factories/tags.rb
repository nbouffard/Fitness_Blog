FactoryBot.define do
  factory :tag do
    tag_name { Faker::Movies::Hobbit.character }
  end
end
