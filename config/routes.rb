Rails.application.routes.draw do
  resources :pages
  root 'pages#quoteform'

  get 'pages/first'
  get 'pages/second'
  get 'pages/third'
  get 'pages/quoteform'
  get 'pages/mainpage_form'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
