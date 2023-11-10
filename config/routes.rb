Rails.application.routes.draw do
  resources :posts

  #shortcut for all routes
  resources :pages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #send first get request to the pages route
  # Defines the root path route ("/")
  # root "articles#index"


  # get '/pages', to: 'pages#index'
  #add new post to our posts
  # post '/pages', to: 'pages#create'
 
  #get a form
  # get '/pages/new', to: 'pages#new', as: 'new_page'

  # get '/pages/:id', to: 'pages#show', as: 'page'

  #get existing firm for future editing 
  # get '/pages/:id/edit', to: 'pages#edit', as: 'edit_page'

  #update existing form
  # patch '/pages/:id', to: 'pages#update'
 
  #delete page
  # delete '/pages/:id', to: 'pages#destroy'


  # get '/pages/:id', to: 'pages#show'
    
end
