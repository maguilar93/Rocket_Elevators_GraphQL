Rails.application.routes.draw do
  resources :quote
  root 'quote#new'
  get 'quote/new'
  resources :pages
  root 'pages#first'


  get 'first' => 'pages#first' # index
  get 'second' => 'pages#second' # corporate
  get 'third' => 'pages#third' # residential
  get 'quoteform' => 'pages#quoteform' # quote form


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
