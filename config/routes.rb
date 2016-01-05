Rails.application.routes.draw do
  resources :wikis do
    member do
      post "add-collaborator/:collaborator_id", action: :add_collaborator, as: :add_collaborator
      delete "remove-collaborator/:collaborator_id", action: :remove_collaborator, as: :remove_collaborator
    end
  end
  devise_for :users
  resources :charges, only: [:new, :create]
  put 'users/downgrade', to: 'charges#downgrade', as: :downgrade
  root 'welcome#index'
end
