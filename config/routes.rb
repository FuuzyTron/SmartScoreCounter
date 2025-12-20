Rails.application.routes.draw do
  root "main#index"

  get  "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get  "/settings", to: "settings#edit"
  patch "/settings", to: "settings#update"
end
