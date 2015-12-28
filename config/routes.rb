Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  resources :charges, only: [:new, :create]
  get 'downgrade', to: 'charges#downgrade'
  root 'welcome#index'

end
