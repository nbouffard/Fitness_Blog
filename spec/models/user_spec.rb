require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should not be valid without a username' do
    user = User.new(first_name: 'John', last_name: 'Doe', username: '', email: 'test@test.com', password: 'password')
    user.save!
    expect(user).to_not be_valid
  end
end
