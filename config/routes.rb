# config/routes.rb

require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "dashboard#index"

  # Mount Sidekiq's web interface at /sidekiq
  mount Sidekiq::Web => '/sidekiq'
resources :tries_posts, only: [:index]

end
