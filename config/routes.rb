Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

  devise_for :users

  get '/users' => 'users#index'

  get '/users/:id' => 'users#show', as: :user

  get '/users/:id/edit' => 'users#edit', as: :edit_user
  patch '/users/:id' => 'users#update'


  get '/students' => 'students#index'


  get '/peer_evals' => 'peer_evals#index'

  get '/peer_evals/new' => 'peer_evals#new'
  post '/peer_evals' => 'peer_evals#create'

  get '/peer_evals/:id' => 'peer_evals#show', as: :peer_eval

  get '/peer_evals/:id/edit' => 'peer_evals#edit', as: :edit_peer_eval
  patch '/peer_evals/:id' => 'peer_evals#update'


  get '/group_evals' => 'group_evals#index'

  get '/group_evals/new' => 'group_evals#new'
  post '/group_evals' => 'group_evals#create'

  get '/group_evals/:id' => 'group_evals#show', as: :group_eval

  get '/group_evals/:id/edit' => 'group_evals#edit', as: :edit_group_eval
  patch '/group_evals/:id' => 'group_evals#update'

  get '/teams' => 'teams#index'

  get '/teams/new' => 'teams#new'
  post '/teams' => 'teams#create'

  get '/teams/:id' => 'teams#show', as: :team

  get '/teams/:id/edit' => 'teams#edit', as: :edit_team
  patch '/teams/:id' => 'teams#update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
