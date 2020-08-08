class Order < ApplicationRecord
	has_many :order_products
	belongs_to :customer

	enum payment_method: {クレジットカード:0, 現金:1}
	enum order_status: { waiting_for_payment:0, payment_cofirmation:1, manufacturing:2, prepare_of_ships:3, shipped:4 }
	# enum order_status: { 入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4 }
	enum production_status: { unable_to_start:0, wating_for_production:1, under_production:2, production_completed:3 }
	# enum production_status: { 着手不可:0, 製作待ち:1, 製作中:2, 制作完了:3 }

	validates :shipping_name, presence: true
	validates :shipping_postal_code, presence: true
	validates :shipping_address, presence: true
	validates :total_price, presence: true
	validates :postages_price, presence: true
end
