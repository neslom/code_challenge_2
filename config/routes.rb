Rails.application.routes.draw do
  get "/", to: "boards#index", as: :root

  resources :boards
  resources :tickets
end
