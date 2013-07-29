Qtrack::Application.routes.draw do
  devise_for :users

  resources :users

  resources :projects do
    resources :issues, :shallow => true do
      get 'resolve', :on => :member
      resources :comments
    end
  end

  root :to => redirect('/projects')
end
