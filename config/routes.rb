Rails.application.routes.draw do

  root 'home#index'
  
  get     'login'        => 'sessions#new',     as: 'login'
  post    'authenticate' => 'sessions#create',  as: 'authenticate'
  delete  'logout'       => 'sessions#destroy', as: 'logout'
  
  resources :books do
    resources :reviews, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy], controller: 'review_likes'
    end
  end
end
