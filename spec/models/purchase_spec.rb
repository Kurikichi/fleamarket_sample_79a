require 'rails_helper'

describe Purchase do
  describe '#create' do
    it 'is valid' do
      user = create(:user)
      purchase = build(:purchase)
      purchase.valid?
      expect(purchase).to be_valid
    end

    it 'is invalid without product_id' do
      user = create(:user)
      purchase = build(:purchase, product_id: "")
      purchase.valid?
      expect(purchase.errors[:product_id]).to include("can't be blank")
    end

    it 'is invalid without buyer_id' do
      user = create(:user)
      purchase = build(:purchase, buyer_id: "")
      purchase.valid?
      expect(purchase.errors[:buyer_id]).to include("can't be blank")
    end
  end
end