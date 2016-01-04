Rails.application.routes.draw do

  root :to => 'application#index'

  get '/signout', :to => 'sessions#destroy', :as => 'signout'
  get '/sessions', :to => 'sessions#index', :as => 'login', :path => '/login'

  get '/about', :to => 'application#about', :as => 'about'
  get '/contact', :to => 'application#contact', :as => 'contact'
  get '/motherbase', :to => 'application#motherbase', :as => 'motherbase'

  resources :posts
  resources :categories
  resources :sessions
  resources :messages

  # Post paths
  get '/:category/:permalink', :to => 'posts#permalink_show', :as => 'permalink_post'

  # Category paths
  get '/category/:permalink', :to => 'category#category_show', :as => 'permalink_category'
  # get '/category/', :to => 'category#index', :as => 'categoria_home'

  resources :users do
    collection do
      
    end
  end

end