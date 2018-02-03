namespace :dev do                           # 使用 dev 前綴詞
  task fake_restaurant: :environment do     # 套用 環境變數 使rake能與資料庫互動
    Restaurant.destroy_all                  # 清空 資料庫舊內容

    500.times do |i|                        # 500迴圈 批次生成資料
      ## 使用 FFaker 語法產生假資料
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hour: FFaker::Time.datetime,
        tel_on: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        # 隨機取圖
        image: File.open(Rails.root.join("seed_img/#{rand(0..17)}.jpg"))
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: user_name,
        email: "#{user_name}@example.com",
        password: "12345678"
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_comment: :environment do
    Comment.destroy_all

    Restaurant.all.each do |restaurant| #每間餐廳
      3.times do |i|  #三則評論
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake restaurants"
    puts "now you have #{Comment.count} restaurants data"
  end

end






