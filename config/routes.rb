Rails.application.routes.draw do
  # root 'homes#index'

  resources :homes, defaults: { format: :html }, only: [:index]
  resources :alerts, defaults: { format: :json }
  resources :users, defaults: { format: :json }, only: %w[show index]

  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
end
