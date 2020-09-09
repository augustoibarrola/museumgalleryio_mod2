class SearchesController < ApplicationController
    skip_before_action :authorized

    def new
    end

    def show
        search_term = params['q'].capitalize
        search_type = Search.find(params["search_id"]).name
        if search_type == "artist"
            search_type = "person"
        end
        my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=#{my_token}&#{search_type}=#{search_term}&page=1&per_page=100"
        json = JSON.parse response 

        if !json['total'].zero?
            @objects = json['objects']
        else
            flash[:error] = "No results for #{search_term} :("
            render :new
        end
    end
    
end


