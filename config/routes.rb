OnCallLearning::Application.routes.draw do
  get "home/index"
  root :to => "home#index"

    devise_for :users

    devise_scope :user do
        get 'sign_in', :to => 'devise/sessions#new'
        get 'signin', :to => 'devise/sessions#new'
        get '/users/edit/:id' => 'devise/registrations#edit'
        get 'profile' => 'registrations#edit'
        resource :registration,
          :path => 'profile',
          :controller => 'registrations',
          :as => :user_registration do
            get :cancel
        end
    end

  get "courses" => "courses/index"
  get "courses/index"
  get "courses/new"
  post "courses/new" => "courses#upload"
  
  get "course_revisions" => "courses/index"
  get "course_revisions/index"
  get "course_revisions/new"
  post "course_revisions/new" => "course_revisions#upload"


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
