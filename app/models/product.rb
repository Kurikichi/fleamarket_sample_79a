class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  # belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  # belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'

  belongs_to :category, foreign_key: 'category_id'
  belongs_to :user, foreign_key: 'user-id', optional: true
  has_one :purchase
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  
  def self.search(search)
    if search
      Product.where('name LIKE(?) OR explanation LIKE(?) OR price LIKE(?)', "%#{search}%", "%#{search}%","%#{search}%")
    else
      Product.all
    end
  end

  enum status: {
    新品、未使用:1,未使用に近い:2,目立った傷や汚れなし:3,
    やや傷や汚れあり:4,傷や汚れあり:5,全体的に状態が悪い:6
  }
  enum shipping_charges: {
    "送料込み(出品者負担)":1,
    "着払い(購入者負担)":2
  }

  enum days_until_shipping: {
    "1~2日で発送":1,"2~3日で発送":2,"4~7日で発送":3
  }

  enum exhibition_status: {
    "出品中":1, "売り切れ":2
  }
  

  validates :name, presence:true, length: { maximum: 40 }
  validates :price, presence:true, numericality: { greater_than_or_equal_to: 300 }
  validates :explanation, presence:true, length: { maximum: 1000 }
  validates :status, presence:true
  validates :shipping_charges, presence:true
  validates :shipping_origin, presence:true
  validates :days_until_shipping, presence:true
  validates :category_id, presence:true
  validates :exhibition_status, presence:true

  validates_associated :images
  validates :images, presence:true

end
