require 'sidekiq/web'

Rails.application.routes.draw do
  root "pages#home"
  mount Sidekiq::Web => '/sidekiq'
end
