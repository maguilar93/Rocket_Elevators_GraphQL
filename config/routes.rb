Rails.application.routes.draw do
  resources :pages
<<<<<<< HEAD

  root 'pages#first'
=======
  root 'pages#quoteform'
>>>>>>> 990061974e3ee473db762a1037d04c037c653d06

  get 'pages/first'
  get 'pages/second'
  get 'pages/third'
  get 'pages/quoteform'
  get 'pages/mainpage_form'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
