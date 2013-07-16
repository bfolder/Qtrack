Qtrack::Application.routes.draw do
  devise_for :users

  resources :projects do
    resources :issues, shallow: true do
      resources :comments
    end
  end

  root :to => redirect('/projects')
end
