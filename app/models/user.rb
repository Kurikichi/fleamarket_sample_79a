class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday ,presence: true
  has_many :products
  has_one :delivery_address
  has_one :credit_card, dependent: :destroy
  has_one :purchase
  has_many :comments


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  
  validates :first_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  }, presence: true
  
  validates :last_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  }, presence: true
  
  validates :kana_first_name, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  },presence: true
  
  validates :kana_last_name, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }, presence: true

end


