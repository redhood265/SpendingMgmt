# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: "家電")
Category.create!(name: "ゲーム")
Category.create!(name: "書籍")

BuyItem.create!(category_id: 1, name: "電子レンジ", price: 24000, approval: true)
BuyItem.create!(category_id: 2, name: "KH", price: 7800, approval: true)

BuyItem.create!(category_id: 1, name: "ガスコンロ", price: 44000, approval: true, created_at: 1.months.ago)
BuyItem.create!(category_id: 2, name: "MH", price: 3900, approval: true, created_at: 1.months.ago)

BuyItem.create!(category_id: 1, name: "ディスプレイ", price: 12000, approval: false, created_at: 2.months.ago)
BuyItem.create!(category_id: 2, name: "MTG", price: 2400, approval: true, created_at: 2.months.ago)

BuyItem.create!(category_id: 1, name: "ルンバ", price: 12000, approval: false, created_at: 3.months.ago)
BuyItem.create!(category_id: 2, name: "Steam", price: 3600, approval: true, created_at: 3.months.ago)


