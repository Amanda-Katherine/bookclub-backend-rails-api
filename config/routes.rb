Rails.application.routes.draw do
  resources :gatherings
  resources :members
  resources :book_groups
  resources :books
  # get '/test', to: 'application#test'
end
