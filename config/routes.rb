Rails.application.routes.draw do
  #get 'pages/home'
  #get 'pages/about'
  #get 'pages/contact'

  resources :portfolios, except: [:show]


  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"


  resources :skills
  resources :guides
  resources :categories
  resources :blogs


  root to: "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

end
