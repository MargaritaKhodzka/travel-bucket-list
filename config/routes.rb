Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :destinations do
    resources :categories
  end

  resources :categories

  root 'welcome#home'
  
  authenticated :user do
    root to: 'destinations#index', as: :authenticated_root
  end

  get '/visited_destinations', to: 'users#user_visited'

end
