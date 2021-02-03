Rails.application.routes.draw do
  root to: 'signs#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'personal_information', to: 'users/registrations#new_personal_information'
    post 'personal_information', to: 'users/registrations#create_personal_information'
  end

  resources :signs
  resources :users, only: [:show, :update]
end
