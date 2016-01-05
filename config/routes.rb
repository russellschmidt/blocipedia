Rails.application.routes.draw do
  resources :wikis do
    member do
      post :add_collaborator
      delete :remove_collaborator
    end
  end
  devise_for :users
  resources :charges, only: [:new, :create]
  put 'users/downgrade', to: 'charges#downgrade', as: :downgrade
  root 'welcome#index'
end
