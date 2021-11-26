require 'faker'

50.times do |n|
  name  = Gimei.first.katakana
  email = Faker::Internet.email
  password = 'password'
  # picture = File.open('./app/assets/images/default.png')
  profile = 'よろしくお願いします！'
  experience = 5
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
              #  picture: picture,
               profile: profile,
               experience: experience
              )
end

User.all.each do |user|
  user.posts.create!(
    title: Faker::Superhero.name,
    content: Faker::Superhero.power,
    # image: File.open('./app/assets/images/show.jpg')
  )
end
