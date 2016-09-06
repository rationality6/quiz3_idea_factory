Rails.application.routes.draw do
  
  root "posts#index"

  resources :posts

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]

end
