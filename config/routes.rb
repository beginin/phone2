Phone2::Application.routes.draw do
  #resources :calllogs

  resources :calllogs do
    get 'upload' => 'calllogs#upload', :on => :collection
    post 'upload' => 'calllogs#uploadcvs', :on => :collection
  end


  resources :loadcalls


  resources :holidays


  resources :descriptioncalls


  resources :typeconnects


  resources :typecalls


  resources :simlogs




  resources :userlogs


  resources :users do
    get 'getsim', :on => :member
    get 'putsim', :on => :member
    put 'getsim' => 'users#getsimpost', :on => :member
    put 'putsim' => 'users#putsimpost', :on => :member
    get 'application' => 'users#application', :on => :member
    get 'upload' => 'users#upload', :on => :collection
    post 'upload' => 'users#uploadcsv', :on => :collection
  end

  match 'users/:id/updateproporties' => 'users#updateproporties'

  resources :sumlimits


  resources :schedules


  resources :cfus


  get "page/main"

  get "page/help"

  get "page/about"

  resources :simnumlogs

  #resources :sims

  resources :sims do
    get 'connect', :on => :member
    get 'disconnect', :on => :member
    get 'upload' => 'sims#upload', :on => :collection
    post 'upload' => 'sims#uploadcsv', :on => :collection
  end


  resources :tnumbers do
    get 'upload' => 'tnumbers#upload', :on => :collection
    post 'upload' => 'tnumbers#uploadcsv', :on => :collection
  end

  resources :tarifs

  get '/reports/report1/:id', to: 'reports#report1', :as => :reports_report1
 


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'page#main'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
