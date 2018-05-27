class Choice < ApplicationRecord
  belongs_to :quiz

  validates :quiz_id, presence: true
  validates :sentence, presence: true
end
