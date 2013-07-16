Qtrack::Application.routes.draw do
  devise_for :users

  resources :projects do
    resources :issues
  end

  resources :issues do
    resources :comments
  end

  root :to => redirect('/projects')
end
