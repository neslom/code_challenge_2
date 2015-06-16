Rails.application.routes.draw do
  get "/", to: "dashboard#index", as: :root
end
