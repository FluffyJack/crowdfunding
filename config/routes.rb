Crowdfunding::Engine.routes.draw do

  resources :projects
  resources :donations
  match 'projects/:id' => "projects#show"
  root :to => "projects#index"

end
