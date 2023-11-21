require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user, username: Faker::Internet.username) }
  # let(:category) { FactoryBot.create(:category) }
  let(:blog_post) { FactoryBot.create(:post, user_id: user.id, category: 'one') }
  # before do
  # end
  it 'GET /index' do
    get posts_path
    expect(response).to be_successful
    expect(response.body).to include('Posts')
  end

  it 'GET /show' do
    get post_path(blog_post)
    expect(response).to be_successful
    expect(response.body).to include('Show')
  end

  it 'GET /new' do
    user = create(:user)
    login_as(user, scope: :user)
    get new_post_path
    expect(response).to be_successful
    expect(response.body).to include('New Post')
  end

  describe 'POST /create' do
    context 'With valid parameters' do
      it 'Creates a new post' do
        user = create(:user)
        login_as(user, scope: :user)
        post_params = {
          post: {
            title: 'title',
            content: Faker::Lorem.characters(number: 1550),
            category: 'one'
          }
        }
        expect {
          post '/posts', params: post_params
        }.to change(Post, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end
    context 'Without valid parameters' do
      it 'Should not create a new post' do
        user = create(:user)
        login_as(user, scope: :user)
        invalid_params = {
          post: {
            title: '',
            content: Faker::Lorem.characters(number: 50),
            category: 'one'
          }
        }
        expect {
          post '/posts', params: invalid_params
        }.to_not change(Post, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /edit' do
    context 'Being the post author' do
      it 'Should render edit form' do
        user = create(:user)
        login_as(user, scope: :user)
        post = create(:post, user_id: user.id)
        get edit_post_path(post)
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'With valid user' do
      it 'Should update post' do
        user = create(:user)
        login_as(user, scope: :user)
        post = create(:post, user_id: user.id)
        valid_params = {
          post: {
            title: 'title',
            content: Faker::Lorem.characters(number: 1550),
            category: 'one'
          }
        }
        patch post_path(post), params: valid_params
        expect(response).to have_http_status(:accepted)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'With valid user credentials' do
      it 'Should delete post' do
        user = create(:user)
        login_as(user, scope: :user)
        post = create(:post, user_id: user.id)
        delete post_path(post)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
