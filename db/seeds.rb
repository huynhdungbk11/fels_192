User.create! name: "HuynhDung", email: "huynhdung@gmail.com", password: "111111",
  password_confirmation: "111111", is_admin: true
User.create! name: "NgoVanTien", email: "ngovantien93@gmail.com",
  password: "123456789",
  password_confirmation: "123456789", is_admin: true
User.create!(name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  is_admin: true)
5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email,
  password: password,
  password_confirmation: password)
end

5.times do
  name  = Faker::Name.name
  description = Faker::Lorem.sentence
  Category.create! name: name, description: description
end

categories = Category.take(5)

categories.each do |category|
  15.times do
    name = Faker::Name.name
    content = Faker::Lorem.sentence
    Word.create! name: name, content: content, category_id: category.id
  end
end
