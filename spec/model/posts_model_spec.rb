require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'needs a valid user' do
    user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    post = user.posts.new(title: 'Title of the post', body: 'Body of the post')
    expect(post.save).to be true
  end

  it 'does not get created with an invalid user' do
    user = User.new
    post = user.posts.new(title: 'Title of the post', body: 'Body of the post')
    expect(post.save).to be false
  end

  it 'gets created with correct parameters' do
    user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    post = user.posts.new(title: 'Title of the post', body: 'Body of the post')
    expect(post.save).to be true
  end

  it 'needs title to be created' do
    user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    post = user.posts.new(body: 'Body of the post')
    expect(post.save).to be false
  end

  it 'needs body to be created' do
    user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    post = user.posts.new(title: 'Title of the post')
    expect(post.save).to be false
  end

  it 'needs title and body to be created' do
    user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    post = user.posts.new
    expect(post.save).to be false
  end
end
