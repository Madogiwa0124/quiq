require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'validation' do
    let(:quiz) { FactoryBot.build(:quiz) }
    let(:correct_choice)   { FactoryBot.build(:choice, quiz: quiz, correct: true) }
    let(:incorrect_choice) { FactoryBot.build(:choice, quiz: quiz) }

    it '正しい値が設定されたときは正常な状態となること' do
      quiz.choices = [correct_choice, incorrect_choice]
      expect(quiz).to be_valid
    end

    it '選択肢が複数無い場合はエラーとなること' do
      quiz.choices = [correct_choice]
      expect(quiz).not_to be_valid
    end

    it '正解が1つ以外の場合はエラーとなること' do
      quiz.choices = [incorrect_choice, incorrect_choice]
      expect(quiz).not_to be_valid
      quiz.choices = [correct_choice, correct_choice]
      expect(quiz).not_to be_valid
    end
  end
end
