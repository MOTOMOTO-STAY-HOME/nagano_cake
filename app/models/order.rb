class Order < ApplicationRecord
	has_many :order_products
	belongs_to :customer

	enum payment_method: {クレジットカード:0, 銀行振込:1}

	validates :shipping_name, presence: true
	validates :shipping_postal_code, presence: true
	validates :shipping_address, presence: true
	validates :total_price, presence: true
	validates :postages_price, presence: true
end
