Rails.application.routes.draw do

  get 'users/new'

  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'

  resources :articles
  resources :tags, only: [:show], param: :name
  resources :users
end
