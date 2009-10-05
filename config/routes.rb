ActionController::Routing::Routes.draw do |map|
  map.resources :trends
  map.resources :statuses
  map.resources :emotions
  map.resources :sentiments
  map.trainer   '/trainer', :controller => 'trainer'
  map.root      :controller => 'statuses'
end
