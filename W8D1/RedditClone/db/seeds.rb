# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Sub.delete_all
Post.delete_all

ngoc = User.create(username: "Ngoc", password: "password123")
brittany = User.create(username: "Brittany", password: "password123")
kevin = User.create(username: "Kevin", password: "password123")

s1 = Sub.create(title: "SF bay area", description: "Everything about SF bay area", mod_id: ngoc.id)
s2 = Sub.create(title: "Games", description: "All things related to gaming", mod_id: brittany.id)
s3 = Sub.create(title: "Motion Design", description: "Tips and neat tricks", mod_id: kevin.id)

p1 = Post.create(title: "Best lunch spots", content: "The best lunch spots around a/A campus" ,sub_id: s1.id ,user_id: ngoc.id)
p2 = Post.create(title: "Sims", content: "Such a great game that wastes so much time" ,sub_id: s2.id ,user_id: kevin.id)
p1 = Post.create(title: "Basic how-to", content: "free downloads and downloadable projects" ,sub_id: s3.id ,user_id: brittany.id)