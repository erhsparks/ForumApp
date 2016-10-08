Rails.application.routes.draw do
  root to: redirect('/subs')

  resources :users
  resource :session, only: [:create, :new, :destroy]
  resources :subs
  resources :posts, except: [:index]
end
