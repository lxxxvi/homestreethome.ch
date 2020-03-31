Rails.application.routes.draw do
  namespace :admin do
    resources :releases
    root to: 'releases#index'
  end

  root to: 'admin/releases#index'
end
