require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post_creator) do
    User.create(
      first_name: 'John',
      last_name: 'Smith',
      username: 'username',
      email: 'test@test.com',
      password: 'password'
    )
  end
  let(:user) do
    User.create(
      first_name: 'Jane',
      last_name: 'Doe',
      username: 'something',
      email: 'test2@test.com',
      password: 'password'
    )
  end
  let(:category) do
    Category.create(category_name: 'test')
  end
  let(:post) do
    Post.create(
      title: Faker::Lorem.characters(number: 50),
      content: Faker::Lorem.characters(number: 1550),
      user_id: post_creator.id,
      category_id: category.id
    )
  end
  let(:comment) do
    Comment.new(
      comment: Faker::Lorem.characters(number: 300),
      user_id: user.id,
      post_id: post.id
    )
  end
  it 'Should not be blank' do
    comment.comment = ''
    expect(comment).to_not be_valid
  end
  it 'Should not be more than 300 characters long' do
    comment.comment = Faker::Lorem.characters(number: 301)
    expect(comment).to_not be_valid
  end
end
