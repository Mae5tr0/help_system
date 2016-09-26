Rails.application.routes.draw do

  root to: 'application#index'
  get '*path', to: 'application#index', constraints: ->(request) do
    request.format.html? && !(request.original_fullpath =~ /reports/)
  end

  namespace :api, defaults: { format: 'json'} do
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

  get 'reports/tickets', to: 'reports#tickets'
end
