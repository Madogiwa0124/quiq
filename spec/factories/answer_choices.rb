FactoryBot.define do
  factory :answer_choice do
    association :quiz
    association :choice
    answer_count 1
  end
end
