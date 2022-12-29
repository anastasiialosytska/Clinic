Rails.application.routes.draw do
  devise_for :doctors
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'home#show'
  resource :user, only: :show
  resource :doctor, only: %i[index show]
  resources :doctor_visits, only: %i[show create update]
end
