Rails.application.routes.draw do
  root 'dashboard#home'

  devise_for :users

  resources :tasks do
    collection do
      get :my_tasks
    end
  end

end
