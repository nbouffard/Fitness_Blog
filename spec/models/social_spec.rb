require 'rails_helper'

RSpec.describe Social, type: :model do
  it 'Link should not be blank'do
    link = build(:social, link: '')
    expect(link).to_not be_valid
  end
  it 'Should be a valid URL' do
    link = build(:social, link: 'https://guides.rubyonrailsorg/v4.1/index.html')
    expect(link).to_not be_valid
  end
end
