Rails.application.routes.draw do

  resources :posts do
       #for comments
resources :comments
  #    get    '/comments',          to: 'comments#index', as: 'comments'
  # post   '/comments',          to: 'comments#create'
  # get    '/comments/new',      to: 'comments#new',   as: 'new_comment'
  # get    '/comments/:id',      to: 'comments#show',  as: 'comment'
  # get    '/comments/:id/edit', to: 'comments#edit',  as: 'edit_comment'
  # patch  '/comments/:id',      to: 'comments#update'
  # delete '/comments/:id',      to: 'comments#destroy'

  # get    '/posts/:post_id/comments',          to: 'comments#index', as: 'post_comments'
  # post   '/posts/:post_id/comments',          to: 'comments#create'
  # get    '/posts/:post_id/comments/new',      to: 'comments#new',   as: 'new_post_comment'
  # get    '/posts/:post_id/comments/:id',      to: 'comments#show',  as: 'post_comment'
  # get    '/posts/:post_id/comments/:id/edit', to: 'comments#edit',  as: 'edit_post_comment'
  # patch  '/posts/:post_id/comments/:id',      to: 'comments#update'
  # delete '/posts/:post_id/comments/:id',      to: 'comments#destroy'

  #  get    '/posts/:post_id/comments',          to: 'comments#index', as: 'comments'
  # post   '/posts/:post_id/comments',          to: 'comments#create'
  # get    '/posts/:post_id/comments/new',      to: 'comments#new',   as: 'new_comment'
  # get    '/posts/:post_id/comments/:id',      to: 'comments#show',  as: 'comment'
  # get    '/posts/:post_id/comments/:id/edit', to: 'comments#edit',  as: 'edit_comment'
  # patch  '/posts/:post_id/comments/:id',      to: 'comments#update'
  # delete '/posts/:post_id/comments/:id',      to: 'comments#destroy'


  # get    '/comments',          to: 'comments#index', as: 'comments'
  # post   '/comments',          to: 'comments#create'
  # get    '/comments/new',      to: 'comments#new',   as: 'new_comment'
  # get    '/comments/:id',      to: 'comments#show',  as: 'comment'
  # get    '/comments/:id/edit', to: 'comments#edit',  as: 'edit_comment'
  # patch  '/comments/:id',      to: 'comments#update'
  # delete '/comments/:id',      to: 'comments#destroy'
  end


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
