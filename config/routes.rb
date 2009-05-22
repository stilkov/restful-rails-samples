ActionController::Routing::Routes.draw do |map|
  map.resources :people

  map.resources :people

  map.resources :companies do |company|
    company.resources :people
  end
end
