Rails.application.routes.draw do

root 'static#home'

resources :users
resources :attractions
get "signin" => "sessions#new"
post "signin" => "sessions#create"
get "logout" => "sessions#destroy"
post "ride" => "rides#new"

end