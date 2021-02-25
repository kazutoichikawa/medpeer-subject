Rails.application.routes.draw do
  root to: 'ideas#index'
  get 'search', to: 'ideas#search'
    resources :ideas, only: [:index, :new, :create]
end
