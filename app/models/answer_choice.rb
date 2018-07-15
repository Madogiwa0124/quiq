class AnswerChoice < ApplicationRecord
  belongs_to :quiz
  belongs_to :choice

  scope :answer_count_sums, ->{
    select_txt = <<~TEXT
      answer_choices.quiz_id,
      SUM(answer_choices.answer_count) as answer_count_sum,
      RANK() OVER (ORDER BY SUM(answer_choices.answer_count) DESC) as rank
    TEXT
    select(select_txt).group('quiz_id')
  }
end
