Rails.application.routes.draw do

  root "posts#index"

  resources :posts do
    resources :comments, except: [:index]
    resources :likes, only: [:create, :destroy]
    resources :members, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]

end
