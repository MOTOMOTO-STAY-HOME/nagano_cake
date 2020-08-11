class Order < ApplicationRecord

	has_many :order_products
	belongs_to :customer

	enum payment_method: {クレジットカード:0, 銀行振込:1}
	enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}


	validates :shipping_name, presence: true
	validates :shipping_postal_code, presence: true
	validates :shipping_address, presence: true
	validates :total_price, presence: true
	validates :postages_price, presence: true

	def postages_price
		self.postages_price = 800
	end

	def amount_price
		self.total_price + self.postages_price
	end

end
