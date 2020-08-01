require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it 'is valid' do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id)
      credit_card.valid?
      expect(credit_card).to be_valid
    end

    it 'is invalid without customer_id' do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("can't be blank")
    end

    it 'is invalid without card_id' do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id, card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("can't be blank")
    end
  end
end

