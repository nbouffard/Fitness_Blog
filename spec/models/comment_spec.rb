require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Should not be blank' do
    comment = build(:comment, comment: '')
    expect(comment).to_not be_valid
  end
  it 'Should not be more than 300 characters long' do
    comment = build(:comment, comment: Faker::Lorem.characters(number: 301))
    expect(comment).to_not be_valid
  end
end
