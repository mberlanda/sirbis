Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :questions, only: [:index] do
    collection do
      get :datatable_index
    end
  end

end
