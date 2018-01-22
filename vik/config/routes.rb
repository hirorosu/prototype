Rails.application.routes.draw do
  root :to => 'home#index'

  # オファーカウント
  get 'likes/create/:student_id' => 'likes#create'

  # オファー
  # post "likes/:post_id/create" => "likes#create"
  # get 'students/:id/likes' => 'students#likes'

  # 配信id
  post '/students/:id/updates_live_id' => 'students#update_s_live_id'
  # 学生のリダイレクトページ
  get 'students/redirect' => 'students#redirect'
  # 学生一覧
  get 'students/select' => 'students#select'
  # 学生のPDFアップロード、閲覧
  get '/students/my_page/:id/show/:id' => 'students#show'
  post 'students/:id/update_pdf' => 'students#update_pdf'
  # 学生情報の編集、画像アップロード
  post 'students/:id/update_img' => 'students#update_img'
  post 'students/:id/update' => 'students#update'
  get 'students/my_page/:id/edit_top' => 'students#edit_top'
  # 学生のログイン
  get 'students/login_form' => 'students#login_form'
  post 'login/students' => 'students#login'
  get 'logout/students' => 'students#logout'
  # 学生の新規登録
  post 'students/create' => 'students#create'
  get 'students/new' => 'students#new'
  # 学生のマイページ
  get 'students/my_page/:id' => 'students#detail'

  # welcomeページ
  get 'home/index' => 'home#index'
  get 'home/select' => 'home#select'
  get 'home/about' => 'home#about'

  # 企業のリダイレクトページ
  get 'companies/redirect' => 'companies#redirect'
  # 企業一覧
  get 'companies/select' => 'companies#select'
  # 企業情報の編集、画像アップロード
  post 'companies/:id/update_img' => 'companies#update_img'
  post 'companies/:id/update_bottom' => 'companies#update_bottom'
  post 'companies/:id/update' => 'companies#update'
  get 'companies/my_page/:id/edit_top' => 'companies#edit_top'
  get 'companies/my_page/:id/edit_bottom' => 'companies#edit_bottom'
  # 企業のログイン
  get 'companies/login_form' => 'companies#login_form'
  post 'login' => 'companies#login'
  get 'logout' => 'companies#logout'
  # 企業の新規登録
  post 'companies/create' => 'companies#create'
  get 'companies/new' => 'companies#new'
  # 企業のマイページ
  get 'companies/my_page/:id' => 'companies#detail'

  # (テスト)ユーザページとpdf表示
  get 'users/index' => 'users#index'
  get 'users/about' => 'users#about'
  get 'users/show1' => 'users#show1'
  get 'users/show2' => 'users#show2'
  get 'users/show3' => 'users#show3'
  get 'users/show4' => 'users#show4'

  # (テスト)ユーザ登録
  post 'users/create' => 'users#create'
  get 'users/new' => 'users#new'
  get 'users/select' => 'users#select'
  get 'users/:id' => 'users#detail'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
