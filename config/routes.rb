Rails.application.routes.draw do

  root 'home#index'
  
  get     'login'        => 'sessions#new',     as: 'login'
  post    'authenticate' => 'sessions#create',  as: 'authenticate'
  delete  'logout'       => 'sessions#destroy', as: 'logout'
  
  resources :books do
    member do
      post 'like'
      delete 'unlike/:like_id', action: :unlike, as: 'unlike'
    end
    
    resources :reviews, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy], controller: 'review_likes'
    end
  end

  get '/profile'      => 'users#show'
  get '/profile/edit' => 'users#edit'
  resources :users, only: [:update, :create, :new]
end
