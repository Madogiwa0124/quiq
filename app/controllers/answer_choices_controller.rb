class AnswerChoicesController < ApplicationController
  def create
    @answer_choice = AnswerChoice.find_or_initialize_by(answer_choices_params)
    @answer_choice.answer_count += 1
    if @answer_choice.save
      redirect_to result_quiz_path(id: @answer_choice.quiz, answer_choice_id: @answer_choice.id)
    else
      redirect_to @answer_choice.quiz
    end
  end

  private

  def answer_choices_params
    params.require(:answer_choices).permit(:quiz_id, :choice_id)
  end
end
