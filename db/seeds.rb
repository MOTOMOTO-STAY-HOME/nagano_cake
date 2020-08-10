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
  kana_last_name: "テス",
  kana_first_name: "タロウ",
  email: "test@test.com",
  password: "testtest",
  postal_code: "3001234",
  address: "testtest",
  phone: "12345678912",
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
Product.create!(
  name: "test_cookie",
  discription: "koreha_tesuto",
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
OrderProduct.create!(
  order_id: 1,
  product_id: 2,
  quantity: 2,
  production_status: 0,
  unit_price: 1000,
)


Customer.create!(
	last_name: "user",
	first_name: "1",
	kana_first_name: "ユーザー",
	kana_last_name: "イチ",
	email: "user1@user.com",
	password: "password",
	postal_code: "1600022",
	address: "東京都新宿区新宿２丁目５−１０ 成信ビル4階",
	phone: "09000000000"
	)

ProductGenre.create!(
   	name: "ケーキ"
   	)

Product.create!(
	name: "イチゴのタルト",
    discription: "甘酸っぱくておいしい",
    no_tax_price: 3000,
    product_genre_id: 1
	)

CartProduct.create!(
	customer_id: 1,
    product_id: 1,
    quantity: 1
    )

