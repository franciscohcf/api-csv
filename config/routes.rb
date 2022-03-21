# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    defaults format: :json do
      namespace :v1 do
        resources :movies, only: %i[index]
        post 'seed_movies', to: 'seed_movies#csv_db'
      end
    end
  end
end
