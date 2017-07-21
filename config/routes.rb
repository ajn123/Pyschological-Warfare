Rails.application.routes.draw do




  get 'article/create'

  get 'article/index'

  get 'home/contact'

  root "home#index"
  get 'home/index'
  
  post '/create_email', to: 'home#create_email', as: :create_email

  get 'home/show/:id', to: 'home#show', as: :show_page
  
  get 'home/search/:tag', to: "home#search", as: :search
  
  resources :articles
  resources :users

  get '/patreon' => redirect("https://www.patreon.com/bePatron?u=6850862")

  # TheComments routes
  # TheComments routes
  concern   :user_comments,  TheComments::UserRoutes.new
  concern   :admin_comments, TheComments::AdminRoutes.new
  resources :comments, concerns:  [:user_comments, :admin_comments]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
