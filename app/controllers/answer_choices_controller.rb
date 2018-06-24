class AnswerChoicesController < ApplicationController
  def create
    @answer_choice = AnswerChoice.find_or_initialize_by(answer_choices_params)
    @answer_choice.answer_count += 1
    if @answer_choice.save
      redirect_to quizzes_path
    else
      render 'quizzes/show'
    end
  end

  private

  def answer_choices_params
    params.require(:answer_choices).permit(:quiz_id, :choice_id)
  end
end
