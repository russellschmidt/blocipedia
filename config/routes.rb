Rails.application.routes.draw do
  resources :wikis
  devise_for :users
  resources :charges, only: [:new, :create]
  put 'users/downgrade', to: 'charges#downgrade', as: :downgrade
  put 'wikis/:id/addCollaborator', to: 'wikis#addCollaborator', as: :addCollaborator
  put 'wikis/:id/removeCollaborator', to: 'wikis#removeCollaborator', as: :removeCollaborator
  root 'welcome#index'
end
