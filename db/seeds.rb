# frozen_string_literal: true

require 'faker'

100.times do |_n|
  name  = Gimei.first.katakana
  email = Faker::Internet.email
  password = 'password'
  # picture = File.open('./app/assets/images/default.png')
  profile = 'よろしくお願いします！'
  experience = rand(1..9)
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               #  picture: picture,
               profile: profile,
               experience: experience)
end

User.all.each do |user|
  user.posts.create!(
    title: 'おすすめのトレーニング',
    content: 'EZバーを使ったバーベルカールがおすすめです！'
    # image: File.open('./app/assets/images/show.jpg')
  )
end
