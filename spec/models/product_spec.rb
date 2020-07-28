require 'rails_helper'
describe Product do
  
  describe '#create' do

    it "is invalid without name " do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is valid with name that has less than 40 characters " do
      product = build(:product, name: "a"*40 )
      expect(product).to be_valid
    end

    it "is invalid with name that has more than 41 characters " do
      product = build(:product, name: "a"*41 )
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "is invalid without price " do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is valid more than price 300" do
      product = build(:product, price: 300)
      expect(product).to be_valid
    end
    
    it "is invalid less than price" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end
    
    it "is invalid without explanation " do
      product = build(:product, explanation: "")
      product.valid?
      expect(product.errors[:explanation]).to include("can't be blank")
    end

    it "is valid with explanation that has less than 1000 characters " do
      product = build(:product, explanation: "a"*1000 )
      expect(product).to be_valid
    end

    it "is invalid with explanation that has more than 1001 characters" do
      product = build(:product, explanation: "a"*1001 )
      product.valid?
      expect(product.errors[:explanation]).to include("is too long (maximum is 1000 characters)")
    end

    it "is invalid without status " do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end

    it "is invalid without shipping_charges " do
      product = build(:product, shipping_charges: "")
      product.valid?
      expect(product.errors[:shipping_charges]).to include("can't be blank")
    end

    it "is invalid without shipping_origin " do
      product = build(:product, shipping_origin: "")
      product.valid?
      expect(product.errors[:shipping_origin]).to include("can't be blank")
    end

    it "is invalid without days_until_shipping " do
      product = build(:product, days_until_shipping: "")
      product.valid?
      expect(product.errors[:days_until_shipping]).to include("can't be blank")
    end

    it "is invalid without category_id " do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without exhibition_status " do
      product = build(:product, exhibition_status: "")
      product.valid?
      expect(product.errors[:exhibition_status]).to include("can't be blank")
    end

  end
end


