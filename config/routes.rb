Rails.application.routes.draw do
   root'homes#top'
  namespace :admin do
    #商品のルーティング
    resources :items, only: [:index,:create,:show,:edit,:update]
    #注文のルーティング
    resources :orsers, only: [:show,:update]
    #制作状況のルーティング
    resources :order_details, only: [:update]

    #管理者用のルーティング
    devise_for :admins,skip:[:registrations, :passwords], controllers: {
    sessions:'admins/sessions'
  }
  end
#エンドユーザー側のルーティング設定
devise_for :end_users,skip: [:passwords,], controllers: {
  sessions:      'end_users/sessions',
  registrations: 'public/registrations'
}

  namespace :admin do
    resources :items, except: [:destory]
    resources :orders, only: [:show, :update]
    resources :order_datails, only: [:update]
    resources :genres
  end

  namespace :public do
    resources :end_users, only: [:show, :edit, :update] do
      get 'unsubscribe' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
      patch ':id/withdraw' => 'homes#withdraw', as: 'withdraw_user'
      patch 'withdraw' => 'users#withdraw'
    end
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destory] do
      delete 'destroy_all'
    end
    resources :genres, only: [:index]
    resources :orders, only: [:index, :show, :new, :create] do
      post 'order/confirm' => 'orders#confirm'
      get 'complete'
    end
    resources :address, except: [:new, :show]
  end
end
