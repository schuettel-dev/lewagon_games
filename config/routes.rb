Rails.application.routes.draw do
  get "/sign_in", to: "sessions#new", as: :new_user_session

  resource :dashboard, only: [:show]

  resources :batches, only: [:index, :show, :new, :create, :update, :edit] do
    resources :memberships, only: [:new, :create], module: :batches
  end

  resources :users do
    resource :privileges, only: [:update], module: :users
  end

  resources :memberships, only: [:update, :destroy]
  resources :games, only: [:index]  do
    resource :beatle, only: [:show, :update], module: :games do
      resource :playlist, only: [:show, :edit, :update], module: :beatles
    end
  end

  root to: "dashboards#show"

  devise_for(:users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" })

  devise_scope :user do
    delete "/sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end
end
