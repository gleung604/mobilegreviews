Rails.application.routes.draw do
  root                'static_pages#home'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'popular' => 'static_pages#coming_soon'
  get    'forums'  => 'static_pages#coming_soon'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :articles
  resources :tags, only: [:show], param: :name
  resources :users
end
