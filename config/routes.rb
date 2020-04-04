Rails.application.routes.draw do
  namespace :admin do
    resource :sessions, only: %i[new create destroy]

    resources :releases, only: %i[index show destroy]

    namespace :discogs do
      resources :releases, only: %i[new create]
    end
  end

  root to: 'admin/releases#index'
end
