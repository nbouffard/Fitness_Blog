require 'rails_helper'

RSpec.describe Tag, type: :model do
  # let(:user) do
  #   User.create(
  #     first_name: 'John',
  #     last_name: 'Smith',
  #     username: 'username',
  #     email: 'test@test.com',
  #     password: 'password'
  #   )
  # end
  # let(:category) do
  #   Category.create(category_name: 'test')
  # end
  # let(:post) do
  #   Post.create(
  #     title: Faker::Lorem.characters(number: 50),
  #     content: Faker::Lorem.characters(number: 1550),
  #     user_id: user.id,
  #     category_id: category.id
  #   )
  # end
  # let(:tag) { Tag.new(tag_name: 'test', post_id: post.id) }

  it 'tag_name should not be blank' do
    tag = build(:tag, tag_name: '')
    expect(tag).to_not be_valid
  end
end
