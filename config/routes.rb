Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users do
    resources :questions, only: [:index]
    resources :answers, only: [:index]
    resources :comments, only: [:index]
  end
  resources :questions do
    resources :answers do
      resources :comments
    end
    resources :comments
  end
end
