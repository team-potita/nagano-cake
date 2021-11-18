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
  registrations: 'public/registrations'
}
end
