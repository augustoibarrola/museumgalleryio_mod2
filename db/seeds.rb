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

require 'rest-client'
require 'json'
require_relative '../config/environments/env_setup.rb'

#API key for Cooper Hewitt
token = ENV["token"]

# #user search by location
# location_url = 'https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=' + token + '&location=' + user_input + '&page=1&per_page=100'
# #user search by medium
# medium_url = 'https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=' + token + '&medium=' + user_input + '&page=1&per_page=100'
# #user search by person (artist)
# artist_url = 'https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=' + token + '&person=' + user_input + '&page=1&per_page=100'
# #user search by title
# title_url = 'https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.people.getObjects&access_token=' + token + '&title=' + user_input

Search.create(name: "location")
Search.create(name: "medium")
Search.create(name: "artist")
Search.create(name: "title")