require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'tag_name should not be blank' do
    tag = build(:tag, tag_name: '')
    expect(tag).to_not be_valid
  end
end
