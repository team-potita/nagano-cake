Rails.application.routes.draw do
   root'homes#top'

  #管理者用のルーティング設定
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
#エンドユーザー側のルーティング設定
devise_for :end_users, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
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
      get 'comfirm'
      get 'complete'
    end
    resources :address, except: [:new, :show]
  end
end
