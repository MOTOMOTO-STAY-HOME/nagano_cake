class Ship < ApplicationRecord
  belongs_to :customer
  validates :customer_id, presence: true
  validates :name, presence: :true
  validates :postal_code, presence: :true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: :true
end
