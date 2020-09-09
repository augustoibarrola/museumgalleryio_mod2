# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#get user's request to search in MET API
    #user the search query ??
#pull data from API according to user's request
#display data for user 

Search.destroy_all
User.destroy_all
UserArt.destroy_all
Comment.destroy_all

#created for search types
Search.create(name: "location")
Search.create(name: "medium")
Search.create(name: "artist")
Search.create(name: "title")

