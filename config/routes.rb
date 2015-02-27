Rails.application.routes.draw do

  root 'static_pages#home'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :articles
  resources :tags, only: [:show], param: :name
end
