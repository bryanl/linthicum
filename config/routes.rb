ActionController::Routing::Routes.draw do |map|
  map.namespace(:admin) do |admin|
    admin.resources :users
    admin.resource  :session
    admin.resources :articles
    
    admin.connect "/", :controller => "dashboard"
    admin.login "/login", :controller => "sessions", :action => "new"
    admin.logout "/logout", :controller => "sessions", :action => "destroy"
    
    admin.connect ':controller/:action/:id.:format'
    admin.connect ':controller/:action/:id'    
  end

  map.connect ':year/:month/:day/:slug', :controller => "article", :action => "show"
  map.home "/", :controller => "article"
end
