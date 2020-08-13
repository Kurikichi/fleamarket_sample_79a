require 'rails_helper'

describe DeliveryAddress do
  describe '#create' do
   
    it "postal_code,prefectures_code,city,address,building_name,phone_numberが存在すれば登録できること" do
      delivery_address = build(:delivery_address)
      expect(delivery_eaddress).to be_valid
    end

    it "postal_codeがない場合は登録できないこと" do
      delivery_address = build(:delivery_address, postal_code: nil)
      delivery_address.valid?
      expect(delivery_eaddress.errors[:postal_code]).to include("は不正な値です", "を入力してください")
    end

    it "prefectures_codeがない場合は登録できないこと" do
      delivery_address = build(:delivery_address, prefectures_code: nil)
      delivery_address.valid?
      expect(delivery_eaddress.errors[:prefectures_code]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      delivery_address = build(:delivery_address, city: nil)
      delivery_address.valid?
      expect(delivery_eaddress.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      delivery_address = build(:delivery_address, address: nil)
      delivery_address.valid?
      expect(dlivery_address.errors[:address]).to include("を入力してください")
    end

    it "building_nameがない場合は登録できないこと" do
      delivery_address = build(:delivery_address, building_name: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:building_name]).to include("を入力してください")
    end

    it "phone_numberがない場合は登録できないこと" do
      delivery_address = build(:delivery_address, phone_number: nil)
      delivery_address.valid?
      expect(delivery_eaddress.errors[:phone_number]).to include("を入力してください")
    end
  end
end