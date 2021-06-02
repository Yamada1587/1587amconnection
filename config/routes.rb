Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  root 'lessons#index'
  
  devise_for :users
  resources :users

  resources :lessons do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end

  resources :messages, :only => [:create]

  resources :rooms, :only => [:create, :show, :index]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end

