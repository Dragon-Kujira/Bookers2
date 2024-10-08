Rails.application.routes.draw do
   devise_for :users
    root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  get "search" => "searches#search"

 resources :books, only: [:new, :index, :show, :create, :edit, :update,:destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

 resources :users, only: [:index, :show, :edit, :update] do
  get "search" => "users#search"
  resource :relationships, only: [:create, :destroy]
 	get "followings" => "relationships#followings", as: "followings"
  get "followers" => "relationships#followers", as: "followers"
  end

end
