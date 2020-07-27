require 'rails_helper'
describe Product do
  
  describe '#create' do

    it "is valid without name " do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is valid too long name " do
      product = build(:product, name: "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddde")
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "is valid without price " do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    
    it "is valid less than price" do
      product = build(:product, price: 200)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end
    
    it "is valid without explanation " do
      product = build(:product, explanation: "")
      product.valid?
      expect(product.errors[:explanation]).to include("can't be blank")
    end

    it "is valid too long explanation " do
      product = build(:product, explanation: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:explanation]).to include("is too long (maximum is 1000 characters)")
    end

    it "is valid without status " do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "is valid without shipping_charges " do
      product = build(:product, shipping_charges: "")
      product.valid?
      expect(product.errors[:shipping_charges]).to include("can't be blank")
    end

    it "is valid without shipping_origin " do
      product = build(:product, shipping_origin: "")
      product.valid?
      expect(product.errors[:shipping_origin]).to include("can't be blank")
    end

    it "is valid without days_until_shipping " do
      product = build(:product, days_until_shipping: "")
      product.valid?
      expect(product.errors[:days_until_shipping]).to include("can't be blank")
    end

    it "is valid without category_id " do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    # it "is valid without user_id " do
    #   product = build(:product, user_id: "")
    #   product.valid?
    #   expect(product.errors[:user_id]).to include("can't be blank")
    # end

    it "is valid without exhibition_status " do
      product = build(:product, exhibition_status: "")
      product.valid?
      expect(product.errors[:exhibition_status]).to include("can't be blank")
    end

  end
end


