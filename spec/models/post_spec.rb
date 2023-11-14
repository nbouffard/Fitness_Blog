require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      first_name: 'John',
      last_name: 'Smith',
      username: 'username',
      email: 'test@test.com',
      password: 'password'
    )
  end
  let(:category) do
    Category.create(category_name: 'test')
  end
  let(:post) do
    Post.new(
      title: Faker::Lorem.characters(number: 50),
      content: Faker::Lorem.characters(number: 1550),
      user_id: user.id,
      category_id: category.id
    )
  end
  it 'Title should not be blank' do
    post.title = ''
    expect(post).to_not be_valid
  end
  it 'Title should not be over 60 characters' do
    post.title = Faker::Lorem.characters(number: 62)
    expect(post).to_not be_valid
  end
  it 'Content should not be blank' do
    post.content = ''
    expect(post).to_not be_valid
  end
  it 'Content should not be less than 1500 characters' do
    post.content = Faker::Lorem.characters(number: 1000)
    expect(post).to_not be_valid
  end
end
