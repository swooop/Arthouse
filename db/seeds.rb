# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create({
  name_first: 'Toby',
  name_last: 'Sims',
  password: 'lol',
  email: 'toby.sims@gmail.com'
})

#     gallery = Gallery.create({
#       title: 'Toby is cool',
#       description: 'Do you really need one?',
#       images: [
#         Image.create({title: 'Cool image', description: 'A cool image', gallery: gallery}),
#         Image.create({title: 'Another image', description: 'A dsds image', gallery: gallery}),
#         Image.create({title: 'Wot image', description: 'A ggf image', gallery: gallery}),
#       ]
#     })