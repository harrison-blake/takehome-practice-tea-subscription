Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create]
      resources :customers, only: [:show, :create, :update]
    end
  end
end
