Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'personal_information', to: 'users/registrations#new_personal_information'
    post 'personal_information', to: 'users/registrations#create_personal_information'
  end

  resources :signs do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search_index'
      get 'search_result'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :tops, only: :index
  resources :spots, only: [:new, :create, :edit, :update, :destroy]
end
