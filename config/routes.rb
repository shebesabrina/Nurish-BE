Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :formulas, only: [:index, :show]
      resources :search, only: :index
    end
  end
end
