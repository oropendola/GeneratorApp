Rails.application.routes.draw do
  
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'registrer' }

  resources :topics, only: [:index, :show]
  
  #get 'pages/home'
  #get 'pages/about'
  #get 'pages/contact'

  resources :portfolios, except: [:show] do 
     # con este aniadido incluimos la ruta sort
     put :sort, on: :collection
  end


  get "portfolio/:id", to: "portfolios#show", as: "portfolio_show"


  resources :skills
  resources :guides
  resources :categories

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  root to: "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"


  get 'tech-news', to: 'pages#tech_news'

end
