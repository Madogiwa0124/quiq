class QuizzesController < ApplicationController
  MAX_CHOICES_COUNT = 4
  RANK_LIMIT = 10

  def index
    @quizzes = if params[:search_text]
                 Quiz.includes(:choices).search(params[:search_text])
               else
                 Quiz.includes(:choices)
               end
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def result
    @quiz = Quiz.includes(choices: :answer_choice).find(params[:id])
    if params[:answer_choice_id].present?
      @user_choiced = AnswerChoice.find(params[:answer_choice_id]).choice
    else
      redirect_to @quiz
    end
  end

  def new
    @quiz = Quiz.new
    build_choices
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.choices = reject_blank_choices
    prepare_quiz_image
    if @quiz.save
      redirect_to quiz_path(@quiz)
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
    prepare_quiz_image
    if @quiz.save
      redirect_to quiz_path(@quiz)
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

  def image
    @quiz = Quiz.find(params[:id])
    send_data @quiz.image, type: @quiz.ctype, disposition: 'inline'
  end

  def ranking
    @quiz_ranks = Quiz.ranking(RANK_LIMIT)
  end

  private

  def build_choices
    (MAX_CHOICES_COUNT - @quiz.choices.length).times { @quiz.choices.new }
  end

  def reject_blank_choices
    @quiz.choices.reject { |choice| choice.sentence.blank? }
  end

  def prepare_quiz_image
    quiz_image = QuizImageHelper.build(@quiz.body)
    @quiz.image = quiz_image.tempfile.open.read
    @quiz.ctype = quiz_image.mime_type
  end

  def quiz_params
    params.require(:quiz).permit(:title, :body, :explanation, choices_attributes: %i[id sentence correct])
  end
end
