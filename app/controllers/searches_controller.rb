class SearchesController < ApplicationController
    def new

    end

    def show
        search_term = params['q'].capitalize 
        my_token = ENV["token"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=#{my_token}=#{search_term}&page=1&per_page=100"
    end
end
