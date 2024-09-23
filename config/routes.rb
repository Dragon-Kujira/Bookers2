Rails.application.routes.draw do
   devise_for :users
    root to: "homes#top"
  get "home/about" => "homes#about", as: "about"

 resources :books, only: [:new, :index, :show, :create, :edit, :update,:destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

 resources :users



end
