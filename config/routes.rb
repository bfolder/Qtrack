Qtrack::Application.routes.draw do
  devise_for :users, path_prefix: 'd'

  resources :users

  resources :projects do
    resources :issues, :shallow => true do
      get 'resolve', :on => :member
      resources :comments
    end
  end

  authenticated :user do
    root :to => redirect('/projects')
  end
  unauthenticated :user do
    devise_scope :user do
      get '/' => 'devise/sessions#new'
    end
  end

  authenticated :user do
    root :to => redirect('/projects')
  end
end
