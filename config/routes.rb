Rails.application.routes.draw do
  root to: "links#index"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :users, only: [:new, :create] do
    resources :links, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
