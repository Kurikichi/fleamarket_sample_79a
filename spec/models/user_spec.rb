require 'rails_helper'


describe User do
  describe '#create' do

    it "nickname,email,first_name,last_name,kana_first_name,kana_last_namepassword,birthday,password_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "" )
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(suser.errors[:first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "kana_first_nameがない場合は登録できないこと" do
      user = build(:user, kana_first_name: nil)
      user.valid?
      expect(user.errors[:kana_first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "kana_last_nameがない場合は登録できないこと" do
      user = build(:user, kana_last_name: nil)
      user.valid?
      expect(user.errors[:kana_last_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください", "は7文字以上で入力してください", "は不正な値です")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "重複したnicknameが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:name]).to include("はすでに存在します")
    end

    it "first_nameがない場合は登録できること" do
      user = build(:user, first_name: "佐々木")
      user.valid?
      expect(suser.errors[:first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "sasaki")
      user.valid?
      expect(suser.errors[:first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "last_nameがない場合は登録できること" do
      user = build(:user, last_name: "一郎")
      user.valid?
      expect(user.errors[:last_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "last_nameがない場合は登録できないこと" do
      user = build(:user, last_name: "itirou")
      user.valid?
      expect(user.errors[:last_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "kana_first_nameがない場合は登録できないこと" do
      user = build(:user, kana_first_name: "ササキ")
      user.valid?
      expect(user.errors[:kana_first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "kana_first_nameがない場合は登録できないこと" do
      user = build(:user, kana_first_name: "sasaki")
      user.valid?
      expect(user.errors[:kana_first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "kana_last_nameがない場合は登録できること" do
      user = build(:user, kana_last_name: "一郎")
      user.valid?
      expect(user.errors[:kana_last_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "kana_last_nameがない場合は登録できないこと" do
      user = build(:user, kana_last_name: "itirou")
      user.valid?
      expect(user.errors[:kana_last_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "emailに@とドメインが存在する場合は登録できること " do
      user = create(:user)
      another_user = build(:user, email: "kkk@gmail.com")
      another_user.valid?
      expect(user).to be_valid
    end

    it "emailに@とドメインがない場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: "kkkgmail")
      another_user.valid?
      expect(another_user.errors[:email]).to include("は不正な値です")
    end

    it "重複したemailが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
   
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "password0", password_confirmation: "password0")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "passwo", password_confirmation: "password")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
  end
end
=======
RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

