Rails.application.routes.draw do

  # ignoring default :show route and passing custom show, and as: adds that prefix we can use for links
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end

  # setting the root path i.e home page
  root to: 'pages#home'
end
