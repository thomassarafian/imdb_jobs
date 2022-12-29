require 'sidekiq/web'

Rails.application.routes.draw do
  root "pages#home"
  post "imdb", to: "pages#imdb"
  
  devise_for :users

  authenticated :user, -> (u) {u.admin?} do
    mount Sidekiq::Web => '/sidekiq'
  end
end
