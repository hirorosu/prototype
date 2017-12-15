Rails.application.routes.draw do
  get 'users/index' => 'users#index'
  get 'users/about' => 'users#about'
  get 'users/show1' => 'users#show1'
  get 'users/show2' => 'users#show2'
  get 'users/show3' => 'users#show3'
  get 'users/show4' => 'users#show4'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
