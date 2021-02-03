Rails.application.routes.draw do
  root to: 'signs#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'personal_information', to: 'users/registrations#new_personal_information'
    post 'personal_information', to: 'users/registrations#create_personal_information'
  end

  resources :signs do
    collection do
      get 'search_index'
      get 'search_result'
    end
  end
  resources :users, only: [:show, :update]
end
