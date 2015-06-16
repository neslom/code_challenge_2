Rails.application.routes.draw do
  get "/", to: "boards#index", as: :root

  resources :boards, only: [:new, :create, :index]
end
