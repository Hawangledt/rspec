Rails.application.routes.draw do
  resources :users, only: %i[index create]
  resources :enemies, only: %i[update destroy]
end
