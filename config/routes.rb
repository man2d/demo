Navigator2::Application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_for :admin_users, :controllers => { :sessions => "admin/sessions" }

  root :to => "home#index"
  match '/sitemap' => 'home#sitemap'  
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
    resources :users do
      member do
        get 'notification'
        post 'send_notification'
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
  

  resources :posts
#  namespace :users do
#    member do
#      get 'sell_yacht'
#      get 'pagestyle'
#      get 'personal'
#    end
#    resources :blogs, :resumes
#  end
  resources :pages, :controller => :home
#  match '/javascripts/*path' => Sprockets
#  match '/gallery' => 'gallery#index'
  devise_for :users
  devise_scope :user do
    get '/register', :to => 'registrations#new'
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
  resources :blogs do
    get 'topics/:topic_id' => 'blogs#topics'
    get 'tags/:tag' => 'blogs#tags'
    get 'admin_posts'
    get 'member_posts'
    resources :comments
  end
  match '*path' => 'redirect#index'
  match ':controller/:action(/:id(.:format))'

end
