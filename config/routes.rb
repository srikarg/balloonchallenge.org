Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  root 'static_pages#home'

  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/tutorials', to: 'static_pages#tutorials', via: 'get'
  match '/faq',       to: 'static_pages#faq',       via: 'get'
  match '/balloon',   to: 'static_pages#balloon',   via: 'get'
  match '/parachute', to: 'static_pages#parachute', via: 'get'
  match '/radar-reflector', to: 'static_pages#radar',via: 'get'
  match '/helium',    to: 'static_pages#helium',    via: 'get'
  match '/camera',    to: 'static_pages#camera',    via: 'get'
  match '/get-involved', to: 'static_pages#get-involved', via: 'get'
  match '/gallery',   to: 'static_pages#gallery',   via: 'get'
  match '/learn-more',to: 'static_pages#learn-more',via: 'get'
  match '/learn-more-beginner',to:'static_pages#learn-more-beginner',via:'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'
  match '/regulations',to: 'static_pages#regulations',via: 'get'
  match '/education', to: 'static_pages#education', via: 'get'
  match '/prizes',    to: 'static_pages#prizes',    via: 'get'
  match '/flight-predictors',to:'static_pages#flight-predictors',via:'get'
  match '/safety',    to: 'static_pages#safety',    via: 'get'
  match '/what-is-a-hab',to:'static_pages#what',    via: 'get'
  match '/supplies',  to: 'static_pages#supplies',  via: 'get'
  match '/mission-ops',to:'static_pages#ops',       via: 'get'
  match '/tracker',   to: 'static_pages#tracker',   via: 'get'
  match '/tracker-products',to:'static_pages#tracker-products',via:'get'
  match '/make-a-tracker',to:'static_pages#make-tracker',via:'get'
  match '/payload',   to: 'static_pages#payload',   via: 'get'
  match '/flight-termination',to:'static_pages#termination',via:'get'
  match '/rope',      to: 'static_pages#rope',      via: 'get'
  match '/sensor',    to: 'static_pages#sensor',    via: 'get'
  match '/power',     to: 'static_pages#power',     via: 'get'
  match '/cost',      to: 'static_pages#cost',      via: 'get'
  # match '/registration/thanks', to: 'static_pages#thanks_register', via: 'get'
  match '/teams/:id/add_member/', to: 'teams#add_member', via: 'post', as: 'add_member'
  match '/teams/:id/remove_member/', to: 'teams#remove_member', via: 'delete', as: 'remove_member'
  match '/teams/feed' => 'teams#feed', :as => :feed, :defaults => {:format => 'atom'}, via: 'get'
  match '/teams/thanks', to: 'teams#thanks', via: 'get'
  get '/teams/admin' => 'teams#admin'
  get '/teams/subregion_options' => 'teams#subregion_options'
  get '/teams/all' => 'teams#all_teams'
  get '/teams/search' => 'teams#search'
  devise_scope :user do

    get '/users/sso' => 'sessions#sso'
  end
  resources :teams
  post 'requests/create' => 'requests#create'
  resources :requests
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
