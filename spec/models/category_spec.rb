require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Should not be blank' do
    category = build(:category, category_name: '')
    expect(category).to_not be_valid
  end
end
