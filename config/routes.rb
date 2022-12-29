require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  
  mount Sidekiq::Web => '/sidekiq'
end
