Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/create'

  get 'posts/show'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
end
