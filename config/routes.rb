require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  authenticated :user, -> (u) {u.admin?} do
    mount Sidekiq::Web => '/sidekiq'
  end
end
