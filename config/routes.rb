Rails.application.routes.draw do
  devise_for :admin_users
  
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

  namespace :admin do
    resources :auth, only: [:login]
    root "index#index"
    get '/login', to: 'auth#login'
    get '/test', to: 'test#index'

    get '/user/edit_password' => 'users#edit_password', as: 'user_edit_password'
    post '/user/update_password' => 'users#update_password', as: 'user_update_password'

    resources :articles
    post '/articles/upload_image' => 'articles#upload_image', as: 'articles_upload_image'
    resources :categories
  end

  root "articles#index"
  get '/categories/:id', to: 'articles#category', as: 'category'
  get '/articles/:id', to: 'articles#show', as: 'article'
  get '/rss', to: 'articles#index'
end

