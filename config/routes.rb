Rails.application.routes.draw do
  root'root#index'
  resources :material do
    get :learn

    collection do
      get :learning
    end
  end
end
