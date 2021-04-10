Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'personal_information', to: 'users/registrations#new_personal_information'
    post 'personal_information', to: 'users/registrations#create_personal_information'
  end

  resources :signs, only: [:index, :new, :create, :show, :destroy] do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search_index'
      get 'search_result'
      get 'my_signs'
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :tops, only: :index
  resources :spots, only: [:new, :create, :edit, :update]
  resources :tags, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :user_tag_relations, only: :destroy
  resources :appearances, only: [:new, :create, :edit, :update]
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create] do
      collection do
        get 'reload'
      end
    end
  end
end
