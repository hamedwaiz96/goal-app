Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resources :goals, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :comments, only: [:create]
end
