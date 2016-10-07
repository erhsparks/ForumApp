Rails.application.routes.draw do
  root to: redirect('http://www.reddit.com')

  resources :users
  resource :session, only: [:create, :new, :destroy]
  resources :subs
  resources :posts, only: [:create, :new, :edit, :destroy, :show, :update]
end
