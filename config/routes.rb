Rails.application.routes.draw do
  resources :g_members
  resources :gatherings
  resources :book_groups
  resources :books
  # get '/test', to: 'application#test'
end