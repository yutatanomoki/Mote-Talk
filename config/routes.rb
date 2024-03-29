Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  get 'homes/use' => 'homes#use'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  devise_for :users
  scope module: :public do
    get 'user/quit' => 'users#quit'
    patch 'user/goodbye' => 'users#goodbye'
    resources :users, only: [:show, :edit, :update]
    resources :instructors, only: [:new, :create, :index, :show] do
      resources :favorites, only: [:create, :index, :destroy]
      resources :reviews, only: [:create, :show]
    end
    post 'reservations/verification' => 'reservations#verification'
    get 'reservations/done' => 'reservations#done'
    resources :reservations, only: [:new, :create, :index, :show]
    resources :request_boards, only: [:new, :create, :index, :show]
    resources :rooms, only: [:show, :index]
    resources :direct_messages, only: [:create]
  end

  namespace :instructor do
    get 'user/quit' => 'users#quit'
    patch 'user/goodbye' => 'users#goodbye'
    resource :user, only: [:show, :edit, :update]
    resources :instructor, only: [:index, :show]
    resources :reservations, only: [:index, :show]
    resources :request_boards, only: [:index, :show] do
      resources :board_comments, only: [:create, :destroy]
    end
    resources :rooms, only: [:show, :index]
    resources :direct_messages, only: [:create]
  end
end
