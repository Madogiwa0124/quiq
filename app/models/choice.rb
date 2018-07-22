class Choice < ApplicationRecord
  belongs_to :quiz
  has_one :answer_choice, dependent: :destroy

  validates :sentence, presence: true

  def answers_count
    answer_choice&.answer_count || 0
  end
end
