Rails.application.routes.draw do

  resources :reservations, only: %i[index create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :equipments, only: %i[index show create destroy]
  resources :users, only: %i[show]
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
