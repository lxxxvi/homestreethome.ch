Rails.application.routes.draw do
  namespace :admin do
    resource :sessions, only: %i[new create destroy]

    resources :releases
    root to: 'releases#index'
  end

  root to: 'admin/releases#index'
end
