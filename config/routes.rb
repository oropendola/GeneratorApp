Rails.application.routes.draw do
  resources :topics
  #get 'pages/home'
  #get 'pages/about'
  #get 'pages/contact'

  resources :portfolios, except: [:show]


  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"


  resources :skills
  resources :guides
  resources :categories

  resources :blogs do
    member do
      get :toggle_status
    end
  end


  root to: "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

end
