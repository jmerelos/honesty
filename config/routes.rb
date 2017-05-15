Rails.application.routes.draw do
  get '/home', to: 'pages#home'

#  get '/books', to: 'books#index'
#  get '/books/new', to: 'books#new', as: 'new_book'
#  post '/books', to: 'books#create'
#  get '/books/:id/edit', to: 'books#edit', as: 'edit_book'
#  patch '/books/:id', to: 'books#update'
#  get '/books/:id', to: 'books#show', as: 'book'
#  delete '/books/:id', to: 'books#destroy'

  resources :books
end
