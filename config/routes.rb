Rails.application.routes.draw do
  resources :lists do
    resources :tasks
  end

  get '/new_list', to: 'lists#new', as: 'new_list' # Manually define a route for new_list_path

  root to: 'lists#index'
end
