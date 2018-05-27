class Choice < ApplicationRecord
  belongs_to :quiz

  validates :sentence, presence: true
end
