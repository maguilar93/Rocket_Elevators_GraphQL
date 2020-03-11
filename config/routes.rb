Rails.application.routes.draw do
  
  devise_for :users
  devise_for :employees, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :quote
  resources :leads

  
  root 'leads#new'

  get 'index' => 'leads#new' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'quote#new' # quote form
  get 'login' => 'pages#login'
  get 'leads' => 'leads#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
