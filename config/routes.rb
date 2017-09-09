Rails.application.routes.draw do
  root "homes#index"
  resources :rooms,except:[:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: [:create,:destroy]
    resources :reservations , only: [:create]
  end
  
  devise_for :users,
              path: '',
              path_names: {sign_in:'login',sign_out: 'logout',edit:'profile',sign_up: 'registration'},
              controllers: { omniauth_callbacks: 'omniauth_callbacks',registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 # root "home#index"
 resources :users,only:[:show]
end
