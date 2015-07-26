Rails.application.routes.draw do
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
  post "/rank", to: "article#rank"
  root to: "article#index"
end
