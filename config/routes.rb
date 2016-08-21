Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords'
  }

  put 'settings/update', to: 'settings#update', as: :update_settings

  resources :carousels do
    resources :posters, only: [:new, :create, :destroy]
  end

  get '/c/:id', to: 'displays#carousel', as: :carousel_display
  root 'home#index'
end
