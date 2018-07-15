Rails.application.routes.draw do
  resources :quizzes do
    member do
      get :result
      get :image
    end
  end
  resources :answer_choices
end
