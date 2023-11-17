require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  it 'Title should not be blank' do
    post = build(:post, title: '')
    expect(post).to_not be_valid
  end
  it 'Title should not be over 60 characters' do
    post = build(:post, content: Faker::Lorem.characters(number: 62))
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
end
