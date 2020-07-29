class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.integer :user_id,           null:false, forign_key:true
      t.integer :postal_code,       null:false
      t.integer :prefectures_code,  null:false
      t.string  :city,              null:false
      t.string  :address,           null:false
      t.string  :building_name
      t.string  :phone_number

      t.timestamps
    end
  end
end
