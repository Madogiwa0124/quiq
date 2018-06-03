class Quiz < ApplicationRecord
  has_many :choices
  accepts_nested_attributes_for :choices

  validates :title, presence: true
  validate :require_correct_choice

  def require_correct_choice
    errors.add(:choices, '正解の選択肢がありません。') if choices.select(&:correct).blank?
  end
end
