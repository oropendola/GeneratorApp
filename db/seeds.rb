# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "test@test.com",
  password: "1234",
  password_confirmation: "1234"
  name: "Admin User",
  roles: "site_admin"
	)

User.create!(
  email: "reguser@test.com",
  password: "1234",
  password_confirmation: "1234"
  name: "Regular User",
	)


10.times do |post|
     Post.create!(
        title: "My Blog Post #{post}",
        body: "Dabale arroz a la zorra el abad"
     )
end

puts "10 blog post created"

5.times do |skill|
   Skill.create!(
      title: "Rails #{skill}",
      percent: 14
   )
end

puts "5 skills created"


