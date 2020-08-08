class OrderProduct < ApplicationRecord
	belongs_to :product
	belongs_to :order

	enum production_status: {true:0, false:1}

	validates :quantity, presence: true
	validates :unit_price, presence: true
end
