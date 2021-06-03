Rails.application.routes.draw do
  root to: 'homes#top'
  get 'searches/search' => "searches#search"
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'follows'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :trains do
    resource :favorites, only: [:create, :destroy]
    resources :train_comments, only: [:create, :destroy]
  end
end
