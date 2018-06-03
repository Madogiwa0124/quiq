class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.includes(:choices)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    choices_params[:choices].each { |choice| @quiz.choices.new(choice) }
    if @quiz.save
      redirect_to quizzes_path
    else
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :body, :explanation)
  end

  def choices_params
    params.require(:quiz).permit(choices: [:sentence, :correct])
  end
end
