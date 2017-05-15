Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products, :messages, :comments
  end

  get 'comments', to: 'welcome#index'
  post 'comments', to: 'welcome#create'

  resources :products, :messages

  root "welcome#index"
end
