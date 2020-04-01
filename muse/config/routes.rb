Rails.application.routes.draw do
  devise_for :users
  get "bootstrap", to: "artists#bootstrap"
  root to: "artists#index"
  resources :artists, :songs
  # get "about", to: "application#about"
  # post "artists", to: "artists#create"
  # get "artists/:id/edit", to: "artists#edit", as: :artist_edit
  # patch "artists/:id", to: "artists#update"
  # delete "artists/:id", to: "artists#destroy"
  # get "songs/new", to: "songs#new"
  # post "songs", to: "songs#create"
  # get "artists", to: "artists#index"
  # get "artists/new", to: "artists#new", as: "new_artist"
  # get "artists/:id", to: "artists#show", as: :artist

end