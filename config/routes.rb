Toolfactor::Application.routes.draw do

  resources :tool_reports

  resources :tool_ages

  resources :tool_factors

  resources :ages

  resources :factors

  resources :tools

  resources :fronts
  resources :users
  resources :user_sessions


  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'admin' => 'user_sessions#home', :as => :admin

  match 'admin_home' => 'user_sessions#home', :as => :admin_home

  match 'age_list/:id' => 'tool_ages#index', :as => :age_list
  match 'factor_list/:id' => 'tool_factors#index', :as => :factor_list

  match 'report_logs' => 'tool_reports#export_csv', :as => :report_logs

  match 'setlocale/:locale' => 'fronts#index', :as => :setlocale
  match 'setlocaleadmin/:locale' => 'user_sessions#home', :as => :setlocaleadmin


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
   root :to => 'fronts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
