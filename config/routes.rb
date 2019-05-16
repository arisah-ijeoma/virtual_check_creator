Rails.application.routes.draw do
  root 'virtual_cheques#index'
  resources :virtual_cheques, except: [:edit, :update, :destroy]
end
