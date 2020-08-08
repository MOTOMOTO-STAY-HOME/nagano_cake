class Product < ApplicationRecord
	belongs_to :product_genre
	attachment :image
	has_many :cart_products
	has_many :order_products
end
