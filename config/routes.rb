Rails.application.routes.draw do



  root to: 'home#index'


  resources :users, only: [:new, :create] do
    get 'show_user_biddings/index'

  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :auctions, only: [:new, :create, :index, :show] do
    resources :biddings, only: [:new, :create], shallow: :true

    resources :publishings, only: [:create]


  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
