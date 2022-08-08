Rails.application.routes.draw do
  get "/sign_in", to: "sessions#new", as: :new_user_session

  resource :dashboard, only: [:show]
  namespace :admin do
    resources :batches, only: [:index, :show, :new, :create, :update, :edit] do
      resources :memberships, only: [:new, :create, :destroy], module: :batches
    end
    resources :users do
      resources :memberships, only: [:new, :create, :destroy], module: :users
    end
  end
  root to: "dashboards#show"

  devise_for(:users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" })

  devise_scope :user do
    delete "/sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end
end
