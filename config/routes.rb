Rails.application.routes.draw do

  root :to => 'application#index'

  get '/signout', :to => 'sessions#destroy', :as => 'signout'
  get '/sessions', :to => 'sessions#index', :as => 'login', :path => '/login'

  get '/about', :to => 'application#about', :as => 'about'
  get '/contact', :to => 'application#contact', :as => 'contact'
  get '/motherbase', :to => 'application#motherbase', :as => 'motherbase'

  # Post paths
  get '/:categoria/:permalink', :to => 'posts#show', :as => 'permalink_post'

  # Category paths
  get '/categoria/:permalink', :to => 'category#show', :as => 'categoria_show'
  # get '/category/', :to => 'category#index', :as => 'categoria_home'

  resources :users do
    collection do
      
    end
  end

  resources :posts
  resources :categories
  resources :sessions
  resources :messages

end