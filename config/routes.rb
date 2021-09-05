# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'main#index'

  resources :time_entries, except: :show
  resources :categories, except: :show
  
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'user_time_logs', to: 'reports#user_time'
  get 'category_time_logs', to: 'reports#category_time'

  get 'users', to: 'users#manage'

end
