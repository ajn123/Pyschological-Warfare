Rails.application.routes.draw do

  root "home#index"
  get 'home/index'
  post '/create_email', to: 'home#create_email', as: :create_email
#  get '/create_email', to: 'home#create_email', as: :create_email

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
