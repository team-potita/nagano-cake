Rails.application.routes.draw do
  scope module: :public do
  root to: "homes#top"
  get 'end_users/my_page' => 'end_users#show'
  get 'end_users/edit'
  patch 'end_users/update'

    get 'end_users/unsubscribe'
    patch 'end_users/withdraw'

      resources :items, only: [:index, :show]
      resources :orders, only: [:index, :show, :new, :create] do
        collection do
          post 'order/confirm' => 'orders#confirm'
          get 'complete'
        end
      end
      resources :cart_items, only: [:index, :create, :update, :destory] do
        collection do
        delete 'destroy_all'
      end
    end
      resources :categorys, only: [:index]
      resources :address, except: [:new, :show]
    end

    #管理者用のルーティング
    devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions:'admin/sessions'
  }
#エンドユーザー側のルーティング設定
devise_for :end_users, path: "", skip: [:passwords,], controllers: {
  sessions:      'public/sessions',
  registrations: 'public/registrations'
}

   get "/about" => "public/homes#about"

  namespace :admin do
    root to: "homes#top"
   resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :orders, only: [:show, :update]
    resources :categorys,only:[:index,:create,:edit,:update]
    resources :order_datails, only: [:update]
    resources :end_users,only:[:index,:show,:edit,:update]


  end
end