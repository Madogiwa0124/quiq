class Quiz < ApplicationRecord
  has_many :choices, dependent: :destroy
  has_many :answer_choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates :title, presence: true
  validate :require_multi_choice
  validate :require_only_correct_choice, unless: -> { valid_choices.length < 2 }

  def require_multi_choice
    errors.add(:choices, '選択肢は、2個以上指定してください') if valid_choices.length < 2
  end

  def require_only_correct_choice
    errors.add(:choices, '正解の選択肢は、1つ指定してください') if currect_choices.length != 1
  end

  private

  def valid_choices
    choices.select(&:valid?)
  end

  def currect_choices
    choices.select(&:correct)
  end
end
