class Purchase < ApplicationRecord
  validates :product_id, :buyer_id, presence: true
  belongs_to :product
  belongs_to :user
end
