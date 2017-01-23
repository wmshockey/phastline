Rails.application.routes.draw do

  devise_for :users
  resources :schedules do
    resources :activities
  end    
  resources :results do
    member do
      get 'summary'
      get 'step_detail'
      get 'station_detail'
      get 'station_step_detail'
      get 'station_curves'
      get 'step_flowrates'
      get 'batch_sequence'
      get 'schedule'
      get 'station_schedule'
      get 'batch_detail'
      get 'power'
      get 'step_linefill'
    end
  end
  resources :pumps do
    resources :headpoints
  end
  resources :nominations do
    resources :shipments
  end
  resources :simulations do
    resources :results
    member do
      get 'run'
    end
  end
  resources :commodities
  resources :pipelines do
    resources :segments
    resources :stations do
      resources :units
      resources :results
    end
    resources :elevations
    resources :temperatures
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'simulations#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
