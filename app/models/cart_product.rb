class CartProduct < ApplicationRecord
	belongs_to :customer
	belongs_to :product

	def include_tax_price
		(self.quantity * self.product.no_tax_price * 1.1.to_f).ceil
	end

	def postages_price
		postages_price = 800
	end

end
