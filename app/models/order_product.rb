class OrderProduct < ApplicationRecord
	belongs_to :product
	belongs_to :order

	enum production_status: {着手不可:0, 制作待ち:1, 製作中:2, 制作完了:3}

	validates :quantity, presence: true
	validates :unit_price, presence: true

	def include_tax_unit_price
		(self.unit_price * 1.1).floor
	end

	def include_tax_total_price
		(self.quantity * self.unit_price * 1.1).floor
	end
end
