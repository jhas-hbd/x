Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'


    resources :plans, only: [:new, :create, :show, :edit, :update, :index] do
      member do
        get 'check'
        patch 'status'
      end
      resources :days, only: [:new, :create, :edit, :update, :destroy] do
        resources :schedules, except: [:show, :index]
      end
    end
    
    get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
