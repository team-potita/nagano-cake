Rails.application.routes.draw do
   root'homes#top'
  namespace :admin do
    #商品のルーティング
    resources :items, onry: [:index,:create,:show,:edit,:update]
    #注文のルーティング
    resources :orsers, onry: [:show,:update]
    #制作状況のルーティング
    resources :order_details, onry: [:update]

    #管理者用のルーティング
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  end
#エンドユーザー側のルーティング設定
devise_for :end_users, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'public/registrations'
}
#商品のルーティング
resources :items ,onry:[:index,:show]

resources :cart_items,onry:[:index,:update,:create,:destroy]
get 'cart_items' => 'public/cart_items#destroy_all'

resources :orders,onry:[:index,:new,:show,:create]
get 'orders' =>  'public/orders#complete'#注文確定画面
get 'orders' =>  'public/orders#comfirm'#注文確認画面

resources :addreses,onry:[:index,:create,:edit,:update,:destroy]

end
