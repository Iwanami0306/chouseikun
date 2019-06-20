User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
users = User.order(:created_at).take(6)
50.times do
  name = "test event"
  memo = Faker::Lorem.sentence(5)
  time = "10/10\r10/11\r10/12"
  users.each { |user| user.events.create!(name: name, memo: memo, time: time) }
end

