require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq', as: :sidekiq

  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      post 'messages'          => 'messages#create'
    end
  end

  resources :messages

  root to: 'messages#index'

end