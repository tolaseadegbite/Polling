Rails.application.routes.draw do
  root to: 'polls#index'
  get 'pages/welcome'
  devise_for :users

  resources :polls do
    resources :poll_items, only: [:create] do
      resource :vote, module: :polls
    end
  end

  get 'welcome', to: 'pages#welcome'
end
