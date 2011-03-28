Navigator2::Application.routes.draw do
  
  devise_for :users

  devise_for :admin_users, :controllers => { :sessions => "admin/sessions" }

  root :to => "home#index"
  
  resources :items
  match 'admin' => 'admin::Pages#index'
  
  namespace "admin" do
    match 'sort/:model' => 'sort#sort'
    match 'typograph/typograph' => 'typograph#typograph'
    resources :pages do
      member do
        get 'menu'
        get 'hide'
      end
    end
    resources :items, :used_items, :hints, :users, :blogs do
      member do
        get 'menu'
      end
    end
    resources :item_properties, :assets, :asset_groups, :banners, :properties, :slides
    resources :blocks
    resources :posts do 
      member do
        get 'menu'  
      end
    end
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
#  match ':controller(/:action(/:id(.:format)))'
  resources :posts
  resources :users do
    resources :blogs, :resumes
  end
  resources :pages, :controller => :home
#  match '/javascripts/*path' => Sprockets
#  match '/gallery' => 'gallery#index'
  devise_for :users
  devise_scope :user do
    get '/register', :to => 'devise/registrations#new'
    get '/login', :to => 'devise/sessions#new'
    get '/logout', :to => 'devise/sessions#destroy'
    
  end
  match '/catalog' => 'catalog#main'
  match '/catalog/s_probegom' => 'catalog#used'
#  match '/catalog/s_probegom/:sort' => 'catalog#used'
  match '/filter' => 'selection#index'
  match '/filter/do' => 'selection#list'
  match '/filter/search' => 'selection#search'
  match '/comparison' => 'comparison#index'
  match '/comparison/pdf' => 'comparison#pdf'
  match '/comparison/:id' => 'comparison#add'
=begin
  Page.all.each do |page|
    unless page.resource
      get page.url => 'home#show', :id => page.id
    else
      get page.url => page.resource.sub('/', '#'), :id => page.id
      get page.url+'/:id' => 'catalog#show'
    end
  end
=end
#  match 'ckeditor/:action(/:id(.:format))' => 'ckeditor'
  namespace :ckeditor do
    resources :pictures, :only => [:index, :create, :destroy]
    resources :attachments, :only => [:index, :create, :destroy]
  end
  
  namespace :about do
    resources :posts
  end

  match '*path' => 'redirect#index'
  match ':controller/:action(/:id(.:format))'

end
