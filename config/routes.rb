MwsttFs::Application.routes.draw do
  match "tags" => "tags#index"
  match "tags/index" => "tags#index"
  match "tags/show/:tag_id" => "tags#show"
  match "tags/destroy/:tag_id" => "tags#destroy"

  match 'today/start' => 'today#start'
  match 'today/stop' => 'today#stop'
  
  resources :activities
  resources :projects
  resources :users
  match "user_sessions/new" => "user_sessions#new"

  match 'datetimes/start' => 'datetimes#start'
  match 'datetimes/stop' => 'datetimes#stop'
  resources :datetimes
  
  match "login" => "user_sessions#new"
  match "user_sessions" => "user_sessions#create"
  match "logout", :controller => "user_sessions", :action => "destroy"
  
  match "account" => "account#index"
  match "registration" => "account#new"
  match "account/create" => "account#create"
  match "account/edit" => "account#edit"
  match "account/update" => "account#update"

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
  # root :to => "welcome#index"
  root :to => "today#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
