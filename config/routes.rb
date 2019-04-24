Rails.application.routes.draw do
  resources :booking_dates
  devise_for :users
  resources :bookings
  resources :rooms
  resources :hotels
  get 'welcome/index'
  root 'welcome#index'

  resources :hotels ,only:[:show] do
	  member do
	    get 'bookings/new'
	  end
 	end

 	resources :hotels, only: [] do
    member do
      get 'bookings/new'
    end
    # Using booking resources
    resources :bookings, only: [:new, :create] do 
      collection do
        get :search_rooms
        # route for checkig available_rooms
        get :available_rooms
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
