Rails.application.routes.draw do
  resources :lists, only: [:create, :destroy, :index, :show]
  get "/create_list", to: "lists#create", as: :create_list

  # Defines the root path route ("/")
  root "lists#index"
end
