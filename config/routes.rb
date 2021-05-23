Rails.application.routes.draw do
  root :to => "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :homes, only: [:index, :new, :create]
  resources :homes do
    post :bulk_add_data, on: :collection
  end  
end
