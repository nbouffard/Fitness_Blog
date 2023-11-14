require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(first_name: 'John', last_name: 'Smith', username: 'username', email: 'test@test.com', password: 'password') }
  let(:user2) { User.new(first_name: 'Jane', last_name: 'Doe', username: '', email: 'test2@test.com', password: 'password') }
  it 'Should not be valid without a username' do
    user.username = ''
    expect(user).to_not be_valid
  end

  it 'Should not be valid with duplicate usernames' do
    user.save
    user2.username = 'username'
    expect(user2).to_not be_valid
  end

  it 'Should not be valid without a first name' do
    user.first_name = ''
    expect(user).to_not be_valid
  end

  it 'Should not be valid without a surname' do
    user.last_name = ''
    expect(user).to_not be_valid
  end
end
