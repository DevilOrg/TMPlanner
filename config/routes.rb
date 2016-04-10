Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  # Mount Grape API
  mount API => '/'

  scope module: :auth do
    get 'sign_in', to: 'sessions#new', as: :new_user_session
    post 'sign_in', to: 'sessions#create', as: :user_session
    get 'sign_out', to: 'sessions#destroy', as: :destroy_user_session
  end

  scope module: :public do
    root 'dashboards#show'
  end

  namespace :admin do
    root 'dashboards#show'
  end

  namespace :dev do
    root 'dashboards#show'
  end

end
