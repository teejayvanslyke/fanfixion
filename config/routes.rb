ActionController::Routing::Routes.draw do |map|
  map.resources :trends
  map.resources :statuses
  map.resources :emotions
  map.resources :sentiments
  map.pivot     '/pivots', :controller => 'pivots', :action => 'show'
  map.trainer   '/trainer', :controller => 'trainer'
  map.about     '/about',   :controller => 'static', :action => 'about'
  map.root      :controller => 'pivots', :action => 'new'
end
