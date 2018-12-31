FactoryBot.define do
  factory :quiz do
    title { 'タイトル' }
    body { '本文' }
    explanation { '解説' }

    trait :with_choices do
      before(:create) do |quiz|
        4.times do |i|
          quiz.choices << FactoryBot.build(:choice, quiz: quiz, sentence: "選択肢_#{i}")
        end
        quiz.choices.first.correct = true
      end
    end

    trait :with_image do
      before(:create) do |quiz|
        quiz_image = QuizImageHelper.build(quiz.body)
        quiz.image = quiz_image.tempfile.open.read
        quiz.ctype = quiz_image.mime_type
      end
    end
  end
end
