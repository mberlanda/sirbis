Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :questions do
    member do
      post :set_answer
    end

    collection do
      get :datatable_index
      get :datatable_unanswered
      get :unanswered
    end
  end

  resources :quizzes

end
