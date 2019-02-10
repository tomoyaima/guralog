Rails.application.routes.draw do


  devise_for :users

  get 'logs' => 'logs#index'
  post 'logs' => 'logs#index'
  get 'logs/mypage' => 'logs#mypage'
  get 'logs/new' => 'logs#new'
  get 'logs/index' => 'logs#index'
  # Fodetails on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get	'logs/show2' =>	'logs#show2'

  get '/'=>'logs#first'
  
  #投稿し、ホームにリダイレクト
  post 'logs/new' => 'logs#create'
  #投稿一覧

  post 'logs/test' => 'logs#test'
  root "logs#index"
    # :edit, :updateを追加
  resources :logs
  resources :logs, only: [:index, :show, :create] do
    resources :likes, only: [:create, :destroy]
  end


end
