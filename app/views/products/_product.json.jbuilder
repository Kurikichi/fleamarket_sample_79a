json.extract! product, :id, :category_id, :user_id, :name, :explanation, :price, :brand, :status, :shipping_charges, :shipping_origin, :days_until_shipping, :created_at, :updated_at
json.url product_url(product, format: :json)
