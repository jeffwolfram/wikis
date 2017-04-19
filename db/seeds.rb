# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

10.times do
    user = User.new
    user.email = Faker::Internet.email
    user.role = "standard"
    user.password = Faker::Internet.password(10, 20, true)
    user.save
  end
30.times do
    users = User.all
    wiki = Wiki.new
    wiki.title = Faker::Book.title[0..40]
    wiki.body = Faker::Lorem.paragraphs
    wiki.user = users.sample
    wiki.private = false
    wiki.save
  end

puts "seed finished"
puts "#{User.count} users were created."
puts "#{Wiki.count} wikis were created."
