require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # let(:user) { FactoryBot.create(:user, username: Faker::Internet.username) }
  # let(:category) { FactoryBot.create(:category) }
  # let(:post) { FactoryBot.create(:post, user_id: user.id, category_id: category.id) }
  # before do
  # end
  it 'GET /index' do
    get posts_path
    expect(response).to be_successful
    expect(response.body).to include('Posts')
  end

  it 'GET /new' do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
    get new_post_path
    expect(response).to be_successful
    expect(response.body).to include('New Post')
  end
end
