Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  resources :charges, only: [:new, :create]
  post 'users/downgrade', to: 'charges#downgrade', as: :downgrade
  root 'welcome#index'
end
