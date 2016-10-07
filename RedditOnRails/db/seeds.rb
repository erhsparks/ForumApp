# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sub.create(title: :a, description: :a, moderator_id: 1)
Sub.create(title: :b, description: :b, moderator_id: 1)
Sub.create(title: :c, description: :c, moderator_id: 1)

Post.create(title: "1", url: ".com", content: "blah", sub_id: 1, author_id: 1)
Post.create(title: "2", url: ".com", content: "blah", sub_id: 2, author_id: 1)
Post.create(title: "3", url: ".com", content: "blah", sub_id: 3, author_id: 1)

User.create(username: "a", password: "asdfasdf")
