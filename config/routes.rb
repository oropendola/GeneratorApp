Rails.application.routes.draw do
  resources :portfolios
  resources :skills
  resources :guides
  resources :categories
  resources :blogs
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
