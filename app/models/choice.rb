class Choice < ApplicationRecord
  belongs_to :quiz
  has_one :answer_choice, dependent: :destroy

  validates :sentence, presence: true
end
