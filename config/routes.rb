Rails.application.routes.draw do

  # ignoring default :show route and passing custom show, and as: adds that prefix we can use for links
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # setting the root path i.e home page
  root to: 'pages#home'
end
