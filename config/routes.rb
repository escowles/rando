Rails.application.routes.draw do
  resources :lists, only: [:create, :destroy, :index, :show]
  post "/create_list", to: "lists#create", as: :create_list
  post "/lists/:id/add", to: "lists#add", as: :add_to_list
  delete "/lists/:id/remove/:value_id", to: "lists#remove", as: :remove_from_list

  # Defines the root path route ("/")
  root "lists#index"
end
