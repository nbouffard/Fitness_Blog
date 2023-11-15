require 'rails_helper'

RSpec.describe Social, type: :model do
  let(:user) { User.create(first_name: 'John', last_name: 'Smith', username: 'username', email: 'test@test.com', password: 'password') }
  let(:link) { Social.new(link: 'https://guides.rubyonrails.org/v4.1/index.html', user_id: user.id)}
  it 'Link should not be blank'do
    link.link = ''
    expect(link).to_not be_valid
  end
  it 'Should be a valid URL' do
    link.link = 'https://guides.rubyonrailsorg/v4.1/index.html'
    expect(link).to_not be_valid
  end
end
