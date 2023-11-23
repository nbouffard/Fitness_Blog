require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  it 'Title should not be blank' do
    post = build(:post, title: '')
    expect(post).to_not be_valid
  end
  it 'Title should not be over 60 characters' do
    post = build(:post, title: Faker::Lorem.characters(number: 62))
    expect(post).to_not be_valid
  end
  it 'Content should not be blank' do
    post = build(:post, content: '')
    expect(post).to_not be_valid
  end
  it 'Content should not be less than 15 characters' do
    post = build(:post, content: Faker::Lorem.characters(number: 10))
    expect(post).to_not be_valid
  end
  it 'Should be valid with correct data' do
    user = create(:user)
    valid_post = build(:post, title: 'My custom title', content: 'My custom content', user_id: user.id)
    expect(valid_post).to be_valid
    expect(valid_post.title).to eq('My custom title')
    expect(valid_post.content).to eq('My custom content')
  end
end
