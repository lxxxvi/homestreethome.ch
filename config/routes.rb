Rails.application.routes.draw do
  namespace :admin do
    resource :sessions, only: %i[new create destroy]

    resources :releases, except: %i[show new create], param: :catalog_number

    namespace :discogs do
      resources :releases, only: %i[new create]
    end
  end

  resources :releases, only: %i[index show], param: :catalog_number

  root to: 'releases#index'
end
