Localisto::Application.routes.draw do
  

  resources :portaluserassignments

  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  #match 'users/:id/edituser' => 'users#adminedit', :as =>:adminedit
   #match 'users/:id/adminedit' => 'users#adminupdate', :as =>:adminupdate
#match 'users/:id/adminupdate' => 'users#adminupdate', :as =>:adminupdate
put 'update_profile/:id' => "users#update_profile", :as => 'update_profile'

match '/adminedit/:id' => 'users#adminedit', :as =>:adminedit



  resources :sessions

  resources :users do
    member do
      put :update_profile
    end
    resources :portaluserassignments
end
   

  resources :projects do 
    resources :results
  end

get "home/index"
match 'agencies/reorder' => 'agencies#reorder'
match 'projects/:project_id/surveyresults' => 'results#indexnolinks'



  resources :appusers

  resources :agencies do
    resources :projects 
  end
  
  resources :projects do 
    resources :images do
       post :sort, on: :collection
end
end

  resources :projects do 
    resources :questions do
       post :sort, on: :collection
# ruby 1.8 would go :on => :collection
end
end

  resources :questions do
    resources :responces do
       post :sort, on: :collection
end
end

resources :agencies do
       post :sort, on: :collection

end






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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
