Qtrack::Application.routes.draw do
  resources :comments


  resources :issues


  resources :projects
  root :to => 'projects#index'
end
