class Quiz < ApplicationRecord
  has_many :choices
  validates :title, presence: true
  validate :require_correct_choice

  def require_correct_choice
    if choices.select{ |choice| choice.correct }.blank?
      errors.add(:choices, "正解の選択肢がありません。")
    end
  end
end
