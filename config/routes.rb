Rails.application.routes.draw do
  devise_for :users

  resources :carousels

  get '/crsl/:id', to: 'home#carousel', as: :carousel_display
  root 'home#index'
end
