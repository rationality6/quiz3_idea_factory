Rails.application.routes.draw do
  
  resources :members
  resources :likes
  root "posts#index"

  resources :posts

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]

end
