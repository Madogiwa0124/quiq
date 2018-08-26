Rails.application.routes.draw do
  root :to => 'quizzes#index'
  resources :quizzes do
    member do
      get :result
      get :image
      post :like, to: 'like#create'
    end
    collection do
      get :ranking
    end
  end
  resources :answer_choices
end
