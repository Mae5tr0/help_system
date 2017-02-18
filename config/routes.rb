Rails.application.routes.draw do
  root to: 'application#index'
  get '*path', to: 'application#index', constraints: lambda do |request|
    request.format.html?
  end

  namespace :api, defaults: { format: 'json' }, constraints: { subdomain: 'api' }, path: '/' do
    namespace :v1 do
      devise_for :users

      resources :users, only: [:index, :show, :update] do
        collection do
          get :profile
        end
      end
      resources :tickets do
        collection do
          get :search
        end
      end
    end
  end
end
