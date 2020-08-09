class OrderProduct < ApplicationRecord
	belongs_to :product
	belongs_to :order

	# enum production_status: {true:0, false:1}
	# enum production_status: { unable_to_start:0, wating_for_production:1, under_production:2, production_completed:3 }
	enum production_status: { 着手不可:0, 製作待ち:1, 製作中:2, 制作完了:3 }

	validates :quantity, presence: true
	validates :unit_price, presence: true
end
