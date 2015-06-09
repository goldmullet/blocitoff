Rails.application.routes.draw do
  get 'items/create'

   devise_for :users

   resources :users, only: [:show]
   
   resources :lists do 
    resources :items
   end

   get 'about' =>'welcome#about'

    
  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end
   
   root to: 'welcome#index'

 end