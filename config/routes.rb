Rails.application.routes.draw do
    #管理者用のルーティング
    devise_for :admins,skip:[:registrations, :passwords], controllers: {
    sessions:'admins/sessions'
  }
#エンドユーザー側のルーティング設定
devise_for :end_users,skip: [:passwords,], controllers: {
  sessions:      'end_users/sessions',
  registrations: 'public/registrations'
}

 root to: "homes#top"
  get "/about" => "homes#about"

  namespace :admin do
    resources :items, except: [:destory]
    resources :orders, only: [:show, :update]
    resources :order_datails, only: [:update]
    resources :categorys
  end

  namespace :public do
    resources :end_users, only: [:show, :edit, :update] do
      get 'unsubscribe' => 'end_users#unsubscribe', as: 'confirm_unsubscribe'
      # patch ':id/withdraw' => 'end_users#withdraw', as: 'withdraw_end_user'
      patch 'withdraw' => 'end_users#withdraw'
    end
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destory] do
      delete 'destroy_all'
    end
    resources :categorys, only: [:index]
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        post 'order/confirm' => 'orders#confirm'
        get 'complete'
      end
    end
    resources :address, except: [:new, :show]
  end
end
