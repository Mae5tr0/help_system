Rails.application.routes.draw do
  root to: 'application#index'
  get '*path', to: 'application#index', constraints: ->(request) { request.format.html? }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users

      resources :users, only: [:index, :show, :update]
      scope :user do
        get :profile, to: 'users#profile'
      end
      resources :tickets do
        collection do
          get :search
        end
      end
    end
  end
end
#TODO fix
# , constraints: { subdomain: 'api' }, path: '/'