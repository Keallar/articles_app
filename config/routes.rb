Rails.application.routes.draw do
  root 'artiles#index'
  get 'about', to: 'pages#about'
  resources :articles, only: %i[show index new create edit update]
end
