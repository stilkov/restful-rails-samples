ActionController::Routing::Routes.draw do |map|
  map.resources :customers do |customers|
    customers.resources :people
  end
end
