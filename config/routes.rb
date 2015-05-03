Rails.application.routes.draw do
  resources :article
  #get '/hello/index', to: 'hello#index'

  root to: "article#index"
end
