Rails.application.routes.draw do

  resources :pages
  
  root 'pages#index'

  get 'index' => 'pages#index' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'pages#quoteform' # quote form
  get 'login' => 'pages#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
