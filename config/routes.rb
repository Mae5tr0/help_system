Rails.application.routes.draw do

  # mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root to: 'application#index'
  get '*path', to: 'application#index', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      devise_for :users

      resources :users, only: [:index, :show]
      resources :tickets
    end
  end
end
