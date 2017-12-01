Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registration => "registrations" }

  resources :users, :orders

  resources :products do
    resources :comments
  end

  devise_for :users,
  :skip => [:registrations, :sessions]

  mount ActionCable.server => '/cable'
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  get 'orders/index'

  post 'static_pages/thank_you'

  get 'static_pages/index'

  get 'products/index'

  post 'payments/create'

  get  'thanks', to: 'payments#create', as: 'thanks'

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
