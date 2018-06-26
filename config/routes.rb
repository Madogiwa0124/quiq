Rails.application.routes.draw do
  resources :quizzes do
    member do
      get :result
    end
  end
  resources :answer_choices
end
