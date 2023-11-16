require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    user = FactoryBot.create(:user, username: Faker::Internet.username)
    category = FactoryBot.create(:category)
    post = FactoryBot.create(:post, user_id: user.id, category_id: category.id)
    get posts_path
    expect(response).to be_successful
    expect(response.body).to include(post.title)
  end
end
