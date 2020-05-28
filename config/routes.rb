Rails.application.routes.draw do
  resources :inventories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/home', to: 'welcome#home'

end
