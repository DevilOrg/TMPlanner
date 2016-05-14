Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  # Mount Grape API
  # mount API => '/'

  # Authorization scope
  scope module: :auth do
    get 'sign_in', to: 'sessions#new', as: :new_user_session
    post 'sign_in', to: 'sessions#create', as: :user_session
    get 'sign_out', to: 'sessions#destroy', as: :destroy_user_session
  end

  # Public scope: main, about us, etc...
  scope module: :public do
    root 'dashboards#show', as: :public_root
  end

  # CRM: admin, settings, users, etc...
  namespace :crm do
    root 'dashboards#show'

    resources :users
  end

end
