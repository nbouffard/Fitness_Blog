require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Should be blank' do
    category = Category.new(category_name: '')
    expect(category).to_not be_valid
  end
end
