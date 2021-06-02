Rails.application.routes.draw do
  root to: 'homes#top'
  get 'searches/search' => "searches#search"
  resource :users, only: [:show]
  resources :trains do
    resource :favorites, only: [:create, :destroy]
    resources :train_comments, only: [:create, :destroy]
  end
  devise_for :users
end
