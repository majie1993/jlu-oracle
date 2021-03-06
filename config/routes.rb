SampleApp::Application.routes.draw do
  
  resources :users
  resources :teams
  resources :teams_users
  resources :projects
  resources :sessions, only: [:new, :create, :destroy]

  
  root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin', to: 'sessions#new',          via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  
  
  resources :users do
    member do
      get 'show_teams'
      #match 'create_teams', to: 'teams#new', via: 'get'
    end
  end
  
  resources :teams do
    member do
      get 'show_members'
      post 'add_members'
      get 'add_members'
      
      get 'show_logs'
      
      get 'show_projects'
      get 'add_projects'
      post 'add_projects'
    end
  end
  
  resources :projects do
    resources 'topics' do
      member do
        post 'show'
        get 'show'
      end
    end
    member do
      get 'show_topics'
      get 'new_topics'
      post 'new_topics'
      
      get 'show_files'
      post 'show_files'
    end
  end
  
  resources :topics do
    
  end
  
  
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
