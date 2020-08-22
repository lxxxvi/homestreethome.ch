Rails.application.routes.draw do
  namespace :admin do
    resource :sessions, only: %i[new create destroy]

    resources :releases, except: %i[show new create], param: :catalog_number

    namespace :discogs do
      resources :releases, only: %i[new create]
    end

    root to: 'sessions#new'
  end

  root to: 'releases#index'
end
