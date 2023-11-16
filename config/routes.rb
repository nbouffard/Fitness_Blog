Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/posts', 'posts#index'
  resources :posts, only: %i[index new]
  # Defines the root path route ("/")
  root "pages#home"
end
