Rails.application.routes.draw do
  devise_for :users

  resources :carousels do
    resources :posters, only: [:new, :create, :destroy]
  end

  get '/c/:id', to: 'displays#carousel', as: :carousel_display
  root 'home#index'
end
