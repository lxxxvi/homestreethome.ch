Rails.application.routes.draw do
  resources :releases, except: %i[show new create], param: :catalog_number

  namespace :discogs do
    resources :releases, only: %i[new create]
  end

  root to: 'releases#index'
end
