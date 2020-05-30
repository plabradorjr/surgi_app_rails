Rails.application.routes.draw do
  resources :services
  resources :inventories
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/home', to: 'welcome#home', as: 'welcome'

end
