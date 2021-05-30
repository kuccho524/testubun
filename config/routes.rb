Rails.application.routes.draw do
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:show]
  resources :trains
  devise_for :users
end
