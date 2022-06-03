Rails.application.routes.draw do

  resources :reservations, only: %i[index create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :equipment, only: %i[index show create destroy]
  resources :user, only: %i[show]
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
