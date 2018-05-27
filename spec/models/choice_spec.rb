require 'rails_helper'

RSpec.describe Choice, type: :model do
  describe "validation" do
    let(:choice) { FactoryBot.build(:choice, quiz: FactoryBot.build(:quiz)) }

    it '正しい値が設定されたときは正常な状態となること' do
      expect(choice).to be_valid  
    end
  end
end
