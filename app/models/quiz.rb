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
    errors.add(:choices, '正解の選択肢は、1つ指定してください') if correct_choices.length != 1
  end

  def correct_choice
    choices.select(&:correct).first
  end

  def self.ranking(num)
    count_sums = AnswerChoice.answer_count_sums.limit(num)
    quizzes = where(id: count_sums.map(&:quiz_id))
    quizzes = quizzes.map do |quiz|
      count_sum = count_sums.select { |r| r.quiz_id == quiz.id }.first
      { quiz: quiz, count_sum: count_sum.answer_count_sum, rank: count_sum.rank }
    end
    quizzes.sort_by { |quiz| quiz[:rank] }
  end

  def self.search(text)
    where("title LIKE :text OR body LIKE :text", text: "%#{text}%") 
  end

  private

  def valid_choices
    choices.select(&:valid?)
  end

  def correct_choices
    choices.select(&:correct)
  end
end
