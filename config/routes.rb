Rails.application.routes.draw do
  #get 'likes/index'
  root 'pages#home'
  #get '/search' , to: 'posts#search'
  get '/pages', to: 'pages#home'
  devise_for :users
  resources :posts do
    collection do
      get :search
    end
  end
  resources :comments
  resources :likes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
