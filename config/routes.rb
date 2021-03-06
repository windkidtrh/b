Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'

  get   '/help',       to: 'static_pages#help'

  get   '/about',      to: 'static_pages#about'

  get   '/contact',    to: 'static_pages#contact'

  get   '/for_point',  to: 'static_pages#for_point'
  get   '/for_device', to: 'static_pages#for_device'
  get   '/for_equip',  to: 'static_pages#for_equip'
  # get   '/for_gm',     to: 'static_pages#for_gm'

  get    '/signup',    to: 'users#new'
  post   '/signup',    to: 'users#create'

  get    '/login',     to: 'sessions#new'
  post   '/login',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'


  resources :devices, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :equips,  only: [:index, :edit,  :show, :update, :create, :destroy]
  resources :points,  only: [:index, :show,  :create, :destroy]
  resources :pgrades, only: [:edit,  :update]
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
