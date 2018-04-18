# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
devices = Device.order(:created_at).take(3)
50.times do
name      = Faker::Lorem.sentence(5)
introduct = Faker::Lorem.sentence(5)
users.each { |user| user.devices.create!(name: name,introduction: introduct) }
end
