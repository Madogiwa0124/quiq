class QuizzesController < ApplicationController
  CHOICES_COUNT = 4.freeze

  def index
    @quizzes = Quiz.includes(:choices)
  end

  def new
    @quiz = Quiz.new
    CHOICES_COUNT.times { @quiz.choices.new }
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quizzes_path
    else
      render :new
    end
  end


  private

  def quiz_params
    params.require(:quiz).permit(:title, :body, :explanation, choices_attributes: [:sentence, :correct])
  end
end
