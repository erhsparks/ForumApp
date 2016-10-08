# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Sub.create(title: "poop", description: "aaaa", moderator_id: 1)
Sub.create(title: "dogs", description: "bbb", moderator_id: 1)
Sub.create(title: "stuff", description: "ccccc", moderator_id: 2)

User.create(username: "a", password: "asdfasdf")
User.create(username: "b", password: "asdfasdf")

Comment.create(content: "cool story bro", author_id: 1, post_id: 1)
Comment.create(content: "cool story bro", author_id: 2, post_id: 1, parent_comment_id: 1)

Post.create(title: "aaaaaaaaaaaa", sub_ids: [1, 2], author_id: 1)
Post.create(title: "aaaaaaaaaaaa", sub_ids: [2, 3], author_id: 2)
