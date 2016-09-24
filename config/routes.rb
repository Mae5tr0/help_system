Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      devise_for :users
      resources :tickets
    end
  end

  # scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
  #   # We are going to list our resources here
  #   resources :users, :only => [:show, :create, :update, :destroy]
  #   resources :sessions, :only => [:create, :destroy]
  # end
end
