Rails.application.routes.draw do
  root 'articles#index'
  get 'about', to: 'pages#about'
  # resources :articles, only: %i[show index new create edit update destroy]
  # same
  resources :articles
end
