# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@admin.com",
  password: "admin10",
)
Customer.create!(
  last_name: "テス",
  first_name: "太郎",
  kana_last_name: "tesu",
  kana_first_name: "tarou",
  email: "test@test.com",
  password: "testtest",
  postal_code: "testtest",
  address: "testtest",
  phone: "testtest",
  is_active: "true",
)
ProductGenre.create!(
  name: "tesuto"
)
Product.create!(
  name: "test_cake",
  discription: "koreha_tesuto_cake",
  no_tax_price: "1000",
  product_genre_id: 1,
)
Ship.create!(
  customer_id: 1,
  name: "test_granma",
  postal_code: "1110000",
  address: "test_granma_hause",
)
Order.create!(
  customer_id: 1,
  shipping_name: "test_granma",
  shipping_postal_code: 1110000,
  shipping_address: "test_granma_hause",
  payment_method: 0,
  total_price: 4100,
  order_status: 0,
  postages_price: 800,
)
OrderProduct.create!(
  order_id: 1,
  product_id: 1,
  quantity: 3,
  production_status: 0,
  unit_price: 3000,
)
