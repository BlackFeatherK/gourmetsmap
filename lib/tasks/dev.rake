namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    100.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hour: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        image: File.open(Rails.root.join("public/seed-img/#{rand(0..20)}.jpg"))
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    User.destroy_all
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: user_name,
        email: "#{user_name}@ccc.com",
        password: "12345678",
        intro: FFaker::Lorem.sentence,
        avatar: File.open(Rails.root.join("public/avatar-p/#{rand(0..8)}.jpg"))
      )
    end
    puts "Have created fake users."
    puts "Now you have #{User.count} user data."
  end

  task fake_comment: :environment do
    Comment.destroy_all
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
          )
      end
    end
    puts "Have created fake comments"
    puts "Now you have #{Comment.count} comment data."
  end

end

