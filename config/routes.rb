Rails.application.routes.draw do
  get 'static_pages/about'

  get 'static_pages/contact'

  resources :article
  resources :users
  resources :sessions
  #get '/hello/index', to: 'hello#index'
  get '/politics', to: 'article#politics'
  get '/oped', to: 'article#oped'
  get '/business', to: 'article#business'
  get '/sports', to: 'article#sports'
  get '/ent', to: 'article#ent'
  get "/logout", to: "sessions#destroy"
  get "search", to: "search#search"
  post "/rank", to: "article#rank"
  post "/like", to: "article#like"
  post "/dislike", to: "article#dislike"
  post "/comment", to: "article#comment"
  root to: "article#index"
end
