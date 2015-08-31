require 'resque_web'

ResqueWeb::Engine.eager_load!

Rails.application.routes.draw do
  root 'static_pages#home'
  get 'search' => 'search#search'
  post 'user/social_auth' => 'users#social_auth'
  resources :users
  get 'statements/browse' => 'statements#browse'
  get 'statements/new' => 'statements#new'
  get 'statements/show/:id' => 'statements#show#'
  resources :statements
  resources :people
  resources :candidates
  resources :elections
  resources :campaigns
  resources :attendees
  resources :event_days
  resources :events
  resources :venues
  mount ResqueWeb::Engine => "/resque_web"
  get 'admin' => 'static_pages#admin'
  get 'attributions' => 'static_pages#attributions'
  get 'ask_the_question_guide' => 'static_pages#ask_the_question_guide'

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
