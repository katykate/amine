Rails.application.routes.draw do
  resources :products
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

	get 'static_pages/landing_page'

	get 'orders/index'

	post 'static_pages/thank_you'

  root 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:index, :show, :create, :destroy]
  
end
