ActionController::Routing::Routes.draw do |map|
  map.resources :trends, :member => { :statuses => :get }
  map.resources :statuses
  map.resources :emotions, :member => { :statuses => :get }
  map.resources :sentiments
  map.pivot     '/pivots', :controller => 'pivots', :action => 'show'
  map.trainer   '/trainer', :controller => 'trainer'
  map.about     '/about',   :controller => 'static', :action => 'about'
  map.root      :controller => 'trends', :action => 'new'
end
