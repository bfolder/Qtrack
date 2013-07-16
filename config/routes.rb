Qtrack::Application.routes.draw do
  devise_for :users

  resources :comments
  resources :issues
  resources :projects

  root :to => redirect('/projects')
end
