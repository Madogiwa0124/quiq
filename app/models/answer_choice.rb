class AnswerChoice < ApplicationRecord
  belongs_to :quiz
  belongs_to :choice
end
