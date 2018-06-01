Rails.application.routes.draw do
  root 'dashboard#home'

  devise_for :users

  post 'dashboard/search'

  resources :tasks do
    collection do
      get :my_tasks
    end
  end

end
