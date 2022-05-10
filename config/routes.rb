Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :pins
  
  root "pins#index"

  resources :pins

  put "/pins/:id/like", to: "pins#like", as: "like"

  delete "/likes/:id", to: "likes#unlike", as: "unlike"

end
