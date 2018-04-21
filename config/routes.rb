Rails.application.routes.draw do

  resources :messages
  devise_for :users, controllers: { sessions: "sessions" }
  root to: "pages#home"
  get "bad", to: "pages#bad"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
