Rails.application.routes.draw do

  root :to => 'application#index'

  get '/signout', :to => 'application#signout', :as => 'signout'

  get '/about', :to => 'application#about', :as => 'about'
  get '/contact', :to => 'application#contact', :as => 'contact'

  resources :clients
  resources :projects do
    member do
      resources :task_lists
    end
  end

  resources :users
  resources :posts
  resources :categories

  # Post paths
  get '/:category/:permalink', :to => 'posts#show', :as => 'permalink_post'

  # Category paths
  get '/category/:permalink', :to => 'category#show', :as => 'categoria_show'
  # get '/category/', :to => 'category#index', :as => 'categoria_home'

end