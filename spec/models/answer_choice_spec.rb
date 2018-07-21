require 'rails_helper'

RSpec.describe AnswerChoice, type: :model do
  describe '.answer_count_sums' do
    let!(:quiz_1) { FactoryBot.create(:quiz, :with_choices) }
    let!(:quiz_2) { FactoryBot.create(:quiz, :with_choices) }

    before do
      FactoryBot.create(:answer_choice, quiz: quiz_1, choice: quiz_1.choices[0], answer_count: 3)
      FactoryBot.create(:answer_choice, quiz: quiz_1, choice: quiz_1.choices[1], answer_count: 2)
      FactoryBot.create(:answer_choice, quiz: quiz_2, choice: quiz_2.choices[0], answer_count: 1)
      FactoryBot.create(:answer_choice, quiz: quiz_2, choice: quiz_2.choices[1], answer_count: 2)
    end

    it 'Quiz別に回答数の合計とランキングが取得出来ること' do
      result = described_class.answer_count_sums
      expect(result[0].rank).to eq 1
      expect(result[0].quiz_id).to eq quiz_1.id
      expect(result[0].answer_count_sum).to eq 5
      expect(result[1].rank).to eq 2
    end
  end
end
