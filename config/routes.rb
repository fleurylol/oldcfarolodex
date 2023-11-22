Rails.application.routes.draw do
  resources :businesses
  get 'delivery/home'
  get 'delivery/maps'
  get 'catering/dispatch'
  get 'catering/packing'
  get 'catering/delivery'
  get 'catering/home'

  authenticate :user, (->(user) { user.admin? }) do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  devise_scope :user do
  get '/users', to: 'devise/registration#new'
  get '/users/password', to: 'devise/password#new'
  get 'users/sign_out' => 'devise/sessions#destroy'
end


  devise_for :users
  resources :contacts do
    member do
      # remove_image_contact_path
      delete :remove_image
  end
end
  


  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


end