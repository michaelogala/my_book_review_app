Rails.application.routes.draw do
  root 'home#index'
  
  get     'login'        => 'sessions#new',     as: 'login'
  post    'authenticate' => 'sessions#create',  as: 'authenticate'
  delete  'logout'       => 'sessions#destroy', as: 'logout'
  
  resources :books do
    resources :reviews
  end
end
