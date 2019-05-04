Rails.application.routes.draw do
  get 'comments/create'
  resources :rooms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "rooms#index"
  post "/comments" => "comments#create"
end
