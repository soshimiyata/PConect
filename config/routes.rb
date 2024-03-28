Rails.application.routes.draw do

  # 顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  scope module: :public do
    root to: "homes#top"
    resources :posts, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
      resource :favorites, only: [:create,:destroy]
      resources :post_comments, only: [:create,:destroy]
    end
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
      #favoriteしたユーザーを判別
      member do
        get :favorites
      end
    end
    get "search_tag"=>"posts#search_tag"
    get '/search', to: 'searches#search'
    resources :notifications, only: [:index]
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
  end

  # 管理者用
  devise_for :admin, skip: [:passwords, :registration] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index,:show,:edit,:update,:destroy]
    resources :posts, only: [:index,:show,:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
