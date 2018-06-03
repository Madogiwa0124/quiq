class QuizzesController < ApplicationController
  MAX_CHOICES_COUNT = 4

  def index
    @quizzes = Quiz.includes(:choices)
  end

  def new
    @quiz = Quiz.new
    build_choices
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.choices = reject_blank_choices
    if @quiz.save
      redirect_to quizzes_path
    else
      build_choices
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
    build_choices
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.attributes = quiz_params
    @quiz.choices = reject_blank_choices
    if @quiz.save
      redirect_to quizzes_path
    else
      build_choices
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

  def build_choices
    (MAX_CHOICES_COUNT - @quiz.choices.length).times { @quiz.choices.new }
  end

  def reject_blank_choices
    @quiz.choices.reject { |choice| choice.sentence.blank? }
  end

  def quiz_params
    params.require(:quiz).permit(:title, :body, :explanation, choices_attributes: %i[id sentence correct])
  end
end
