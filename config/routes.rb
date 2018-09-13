Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :formulas, only: [:index, :show]
      # get '/formulas?allergens=:ingredient', to: 'formulas#index_without_allergens', as: :allergens
      # get '/formulas?p=ingredient:', to: 'formulas#index_without_allergens', as: :allergens
    end
  end
end
