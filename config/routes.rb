Rails.application.routes.draw do
  root 'home#index'

  get     'login'        => 'sessions#new',     as: 'login'
  post    'authenticate' => 'sessions#create',  as: 'authenticate'
  delete  'logout'       => 'sessions#destroy', as: 'logout'

  resources :books, only: [:new, :create, :index]
  get     '/:name'       => 'books#show',       as: 'book'
  get     '/:name/edit'  => 'books#edit',       as: 'edit_book'
  put     '/:name'       => 'books#update',     as: 'update_book'
  delete  '/:name'       => 'books#destroy',    as: 'destroy_book'
end
