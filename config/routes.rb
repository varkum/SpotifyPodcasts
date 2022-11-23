Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/auth/spotify/callback", to: "omniauth_callbacks#spotify"
  get "/home", to: "home#index"

  delete "/signout", to: "sessions#destroy"
  resources :shows
  resources :episodes
  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#index"
end
