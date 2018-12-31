FactoryBot.define do
  factory :choice do
    sentence { '選択肢' }
    correct { false }
    association :quiz
  end
end
