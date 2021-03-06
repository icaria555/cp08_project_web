Newrotten::Application.routes.draw do
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  # get 'movies/sortby/:sort' => 'users#index',:as => 'sort'
  resources :users
  get '/users/:id/new_relation' => 'users#new_relate', :as => 'new_relate'
  post '/users/:id/new_relation' => 'users#create_relate'
  delete '/users/:id/new_relation/:id2' => 'users#delete_relate', :as => 'delete_relate'
  get 'users/:id/talk' => 'users#talk_tosomeone'
  get 'users/:id/talk/:id2' => 'users#talk_tosomeone', :as => 'conversation'
  post 'users/:id/talk/:id2' => 'users#sent', :as => 'conversation2'

  get '/login' => 'sessions#index' ,:as => 'login'
  root :to => redirect('/users') #set default root page

  #match  '/auth/:provider/callback' => 'sessions#create'
  post '/login' => 'sessions#createSess'
  get '/logout' => 'sessions#destroy'
  get  '/auth/failure' => 'sessions#failure'
  post '/senddata' => 'sessions#recieve'
  
  post '/owner' => 'sessions#findowner'
  post '/belong' => 'sessions#belong'
  put '/hardwares/:id/edit' => 'hardwares#update', :as => 'hardware_edit'
  get '/hardwares/:id/edit' => 'hardwares#edit_owner'
  get '/hardwares/new' => 'hardwares#new', :as => 'new_hardware'
  
  delete '/users/delete' => 'hardwares#delete', :as => 'delete_hardware'
end
