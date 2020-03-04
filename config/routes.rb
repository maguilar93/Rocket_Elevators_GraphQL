Rails.application.routes.draw do
<<<<<<< HEAD
=======
  resources :pages
>>>>>>> bb3ef0c913d9ac69ad9489e39c1aadb24eaf7417
  root 'pages#first'

  get 'pages/first'
  get 'pages/second'
  get 'pages/third'
  get 'pages/quoteform'
  get 'pages/mainpage_form'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
