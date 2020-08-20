Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about'
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  resources :users,only: [:show,:index,:edit,:update] do
  	member do
  		get :follow_users, :follower_users
  	end
  end
  resources :books do
  	resource :favorites,only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  get '/search' => 'search#search'
end