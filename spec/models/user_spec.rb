require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should not be valid without a username' do
    user = build(:user, username: '')
    expect(user).to_not be_valid
  end

  it 'Should not be valid with duplicate usernames' do
    create(:user)
    user2 = build(:user)
    expect(user2).to_not be_valid
  end

  it 'Should not be valid without a first name' do
    user = build(:user, first_name: '')
    expect(user).to_not be_valid
  end

  it 'Should not be valid without a surname' do
    user = build(:user, last_name: '')
    expect(user).to_not be_valid
  end
end
