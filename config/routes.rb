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
    collection do
      get 'search_index'
      get 'search_result'
      get 'my_signs'
      get 'match_signs'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    collection do
      post 'guest_sign_in'
    end
  end
  resources :tops, only: :index
  resources :tags, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
      get 'after_sign_up_new'
      post 'after_sign_up_create'
    end
  end
  resources :user_tag_relations, only: :destroy
  resources :rooms, only: [:index, :new, :create] do
    collection do
      get 'talk_rooms'
    end
    resources :messages, only: [:index, :create] do
      collection do
        get 'reload'
      end
    end
  end
end
