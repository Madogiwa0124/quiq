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

  describe '.ranking' do
    let!(:quiz_1) { FactoryBot.create(:quiz, :with_choices) }
    let!(:quiz_2) { FactoryBot.create(:quiz, :with_choices) }
    let!(:quiz_3) { FactoryBot.create(:quiz, :with_choices) }

    before do
      FactoryBot.create(:answer_choice, quiz: quiz_1, choice: quiz_1.choices[0], answer_count: 3)
      FactoryBot.create(:answer_choice, quiz: quiz_1, choice: quiz_1.choices[1], answer_count: 2)
      FactoryBot.create(:answer_choice, quiz: quiz_2, choice: quiz_2.choices[0], answer_count: 1)
      FactoryBot.create(:answer_choice, quiz: quiz_2, choice: quiz_2.choices[1], answer_count: 2)
      FactoryBot.create(:answer_choice, quiz: quiz_3, choice: quiz_3.choices[1])
    end

    it 'ランキング順にQuizのインスタンスを取得出来ること' do
      result = described_class.ranking(2)
      expect(result[0][:quiz]).to eq quiz_1
      expect(result[0][:rank]).to eq 1
      expect(result[0][:count_sum]).to eq 5
      expect(result[1][:quiz]).to eq quiz_2
      expect(result[1][:rank]).to eq 2
    end
  end

  describe '#correct_choice' do
    let(:quiz) { FactoryBot.build(:quiz) }
    let(:correct_choice) { FactoryBot.build(:choice, quiz: quiz, correct: true) }

    before do
      quiz.choices << correct_choice
      quiz.choices << FactoryBot.build(:choice, quiz: quiz)
    end

    it '正解の選択肢が取得されること' do
      expect(quiz.correct_choice).to eq correct_choice
    end
  end
end
