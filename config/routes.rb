Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations',
  }

    namespace :instructor do
      resources :users,only: [:index,:show,:edit,:update]
      resources :products, only: [:new, :create, :index, :show, :edit, :update]
      root 'homes#top'
      resources :reservations, only: [:index, :show]
      resources :request_boards, only: [:index, :show] do
        resources :board_comments, only: [:create, :destroy]
      end
    end

    scope module: :public do

      get 'user/quit' => 'users#quit'
      patch 'user/goodbye' => 'users#goodbye'
      resource :user, only: [:index, :show, :edit, :update] do
        resources :favorites, only: [:create, :destroy]
      end
      post 'reservations/verification' => 'reservations#verification'
      get 'reservations/done' => 'reservations#done'
      resources :reservations, only: [:new, :create, :index, :show]
      resources :request_boards, only: [:new, :create, :index, :show]
      resources :rooms, only: [:show, :index]
      resources :direct_messages, only: [:create]
    end

end