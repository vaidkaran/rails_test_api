require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'should return a status code of 401 if the auth token is not passed in headers' do
    get '/posts/index'
    expect(response).to have_http_status(401)
  end

  it 'should return the correct json response if auth token is valid' do
    post '/auth', headers: {email: 'test0@test.com', password: 'password', password_confirmation: 'password'}
    res_headers = response.headers

    auth_headers = {  'access-token' => res_headers['access-token'],
                      'token-type'   => res_headers['token-type'],
                      'uid'          => res_headers['uid'],
                      'expiry'       => res_headers['expiry'],
                      'client'       => res_headers['client'] }

    get '/posts/index', headers: auth_headers
    expect(response).to have_http_status(200)
  end
end
