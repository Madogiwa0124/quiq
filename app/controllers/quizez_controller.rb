class QuizezController < ApplicationController
  def index
    @quizez = Quiz.includes(:choices)
  end

  def new
  end

  def create
  end
end
