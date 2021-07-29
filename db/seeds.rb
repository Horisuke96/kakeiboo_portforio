# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

20.times do |n|
  sample_last_name = Gimei.last.kanji
  sample_last_kana = Gimei.last.katakana
  sample_first_name = Gimei.first.kanji
  sample_first_kana = Gimei.first.katakana
  sample_nickname = Gimei.first.katakana
  sample_address = Gimei.address.kanji
  sample_tel = Faker::Number.number(digits: 11)
  sample_email = Faker::Internet.email


  User.create!(
    last_name:              sample_last_name,
    kana_last_name:         sample_last_kana,
    first_name:             sample_first_name,
    kana_first_name:        sample_first_kana,
    nickname:               sample_nickname,
    postal_code:            "1111111",
    address:                sample_address,
    phone_number:           sample_tel,
    email:                  sample_email,
    password:               "aaaaaa",
    created_at:             "2021-01-01 00:00:00",
    updated_at:             "2021-01-01 00:00:00"
  )
end


Admin.create!(
   email: 'admin@admin.com',
   password: 'adminadmin',
)

ExpenseType.create!(
    [
      { type_name: "食費" },
      { type_name: "日用雑貨" },
      { type_name: "交通" },
      { type_name: "交際費" },
      { type_name: "エンタメ" },
      { type_name: "教育・教養" },
      { type_name: "美容・衣服"},
      { type_name: "医療・保険" },
      { type_name: "通信" },
      { type_name: "水道光熱費" },
      { type_name: "住まい" },
      { type_name: "クルマ" },
      { type_name: "税金" },
      { type_name: "大型出費" },
      { type_name: "その他" },
    ]
  )