class Quiz < ApplicationRecord
  has_many :choices
  validates :title, presence: true
end
