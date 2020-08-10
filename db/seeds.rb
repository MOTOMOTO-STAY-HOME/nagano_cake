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