class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	#attachment :image
	validates :quantity, presence: true, format: { with: /\A\d+\z/ }

	def include_tax_unit_price
		#(self.product.no_tax_price * 1.1.to_f).ceil * self.quantity
		 (self.product.no_tax_price * 1.1).floor
	end

	def include_tax_total_price
		#(self.product.no_tax_price * 1.1.to_f).ceil * self.quantity
		(self.quantity * self.product.no_tax_price * 1.1).floor
	end
end
