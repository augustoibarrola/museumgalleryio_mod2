class SearchesController < ApplicationController

    def new
    end

    def show
        search_term = params['q'].capitalize
        search_type = Search.find(params["search_id"]).name 
        #my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=632aeca2d345e4834ae6b3b30244cf04&#{search_type}=#{search_term}&page=1&per_page=100"
        json = JSON.parse response 

        if !json['total'].zero?
            @objects = json['objects']
        else
            render :new
        end
    end
    
end


