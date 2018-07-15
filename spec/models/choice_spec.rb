require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe 'validation' do
    let(:choice) { FactoryBot.build(:choice, quiz: FactoryBot.build(:quiz)) }

    it '正しい値が設定されたときは正常な状態となること' do
      expect(choice).to be_valid
    end
  end

  describe '#answers_count' do
    let!(:quiz) { FactoryBot.create(:quiz, :with_choices) }
    let(:answered_choice) { quiz.choices.first }
    let(:unanswered_choice) { quiz.choices.last }

    context '紐づく回答が存在する場合' do
      before { FactoryBot.create(:answer_choice, quiz: quiz, choice: answered_choice) }

      it '紐づく回答の回答数が返却されること' do
        expect(answered_choice.answers_count).to eq answered_choice.answer_choice.answer_count
      end
    end

    context '紐づく回答が存在しない場合' do
      it '0が返却されること' do
        expect(quiz.choices.last.answers_count).to eq 0
      end
    end
  end
end
