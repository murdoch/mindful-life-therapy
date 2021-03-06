Rails.application.routes.draw do
  get 'login', to: 'logins#new', as: :login
  get 'login/create', to: 'logins#create', as: :create_login
  delete 'login', to: 'logins#destroy', as: :logout

  resource :about_page, only: [:show, :edit, :update], controller: 'about_page', path: 'about-mindful-life-therapy'
  resource :counselling_page, only: [:show, :edit, :update], controller: 'counselling_page', path: 'counselling-and-psychotherapy-in-glasgow'
  resource :mindfulness_page, only: [:show, :edit, :update], controller: 'mindfulness_page', path: 'mindfulness-training-in-glasgow'
  resource :settings, only: [:edit, :update]

  get '/terms-and-conditions', to: 'terms_and_conditions#show', as: 'terms_and_conditions'
  get '/privacy-policy', to: 'privacy_policy#show', as: 'privacy_policy'

  get '/office-location', to: 'map#show', as: 'map_page'
  get '/contact-mindful-life-therapy', to: 'contact#new', as: 'contact'
  post '/contact-mindful-life-therapy', to: 'contact#create', as: 'create_contact'
  get '/admin', to: 'admin#show', as: 'admin'

  root 'home_page#show'

  get '*unmatched_route', to: 'application#raise_routing_error', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
