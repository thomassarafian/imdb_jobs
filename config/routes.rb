require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'movies#index'
  post "imdb", to: "movies#imdb"
  devise_for :users

  authenticated :user, -> (u) {u.admin?} do
    mount Sidekiq::Web => '/sidekiq'
  end
end
