Rails.application.routes.draw do
  root 'home#index'

  get     'login'        => 'sessions#new',     as: 'login'
  post    'authenticate' => 'sessions#create',  as: 'authenticate'
  delete  'logout'       => 'sessions#destroy', as: 'logout'

  resources :books, only: [:new, :create, :index]
  get     'books/:name'       => 'books#show',       as: 'book'
  get     'books/:name/edit'  => 'books#edit',       as: 'edit_book'
  put     'books/:name'       => 'books#update',     as: 'update_book'
  delete  'books/:name'       => 'books#destroy',    as: 'destroy_book'
end
