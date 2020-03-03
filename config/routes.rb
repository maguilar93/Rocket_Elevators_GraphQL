Rails.application.routes.draw do
  root 'pages#first'



  get 'pages/first'
  get 'pages/second'
  get 'pages/third'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
