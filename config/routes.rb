Rails.application.routes.draw do
  root :to => 'quizzes#index'
  resources :quizzes do
    member do
      get :result
      get :image
    end
    collection do
      get :ranking
    end
  end
  resources :answer_choices
end
