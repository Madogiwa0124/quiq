FactoryBot.define do
  factory :quiz do
    title 'タイトル'
    body '本文'
    explanation '解説'

    trait :with_choices do
      before(:create) do |quiz|
        4.times do |i|
          quiz.choices << FactoryBot.build(:choice, quiz: quiz, sentence: "選択肢_#{i}")
        end
        quiz.choices.first.correct = true
      end
    end
  end
end
