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
#商品のルーティング
resources :items ,only: [:index,:show]

resources :cart_items,only: [:index,:update,:create,:destroy]
get 'cart_items' => 'public/cart_items#destroy_all'

resources :orders,only:[:index,:new,:show,:create]
get 'orders' =>  'public/orders#complete'#注文確定画面
get 'orders' =>  'public/orders#comfirm'#注文確認画面

resources :addreses,only:[:index,:create,:edit,:update,:destroy]

end
