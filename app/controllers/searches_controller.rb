class SearchesController < ApplicationController
    skip_before_action :authorized, only: [:new, :show]

    def new
        my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        json = JSON.parse response 
        object_id = json["objects"].sample["id"]
        object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{object_id}"
        object_json = JSON.parse object_response
        @one = object_json["object"]

        second_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        second_json = JSON.parse second_response 
        second_id = second_json["objects"].sample["id"]
        second_object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{second_id}"
        second = JSON.parse second_object_response
        @second = second["object"]

        third_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        third_json = JSON.parse third_response 
        third_id = third_json["objects"].sample["id"]
        third_object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{third_id}"
        third = JSON.parse third_object_response
        @third = third["object"]

        fourth_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        fourth_json = JSON.parse fourth_response 
        fourth_id = fourth_json["objects"].sample["id"]
        fourth_object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{fourth_id}"
        fourth = JSON.parse fourth_object_response
        @fourth = fourth["object"]

    end

    def show
        search_term = params['q'].capitalize
        search_type = Search.find(params['search_id']).name
        if search_type == "artist"
            search_type = "person"
        end
        my_token = ENV['TOKEN']
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=#{my_token}&#{search_type}=#{search_term}&page=1&per_page=8"
        json = JSON.parse(response)

        if !json['total'].zero?
            @objects = json['objects']
        else
            flash[:error] = "No results for #{search_term} :("
            redirect_to user_search_path
        end
    end

    def usernew
        my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        json = JSON.parse response 
        object_id = json["objects"].sample["id"]
        object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{object_id}"
        object_json = JSON.parse object_response
        @one = object_json["object"]

        second_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        second_json = JSON.parse second_response 
        second_id = second_json["objects"].sample["id"]
        second_object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{second_id}"
        second = JSON.parse second_object_response
        @second = second["object"]

        third_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        third_json = JSON.parse third_response 
        third_id = third_json["objects"].sample["id"]
        third_object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{third_id}"
        third = JSON.parse third_object_response
        @third = third["object"]

        fourth_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        fourth_json = JSON.parse fourth_response 
        fourth_id = fourth_json["objects"].sample["id"]
        fourth_object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{fourth_id}"
        fourth = JSON.parse fourth_object_response
        @fourth = fourth["object"]
    end

    def usershow
        search_term = params['q'].capitalize
        search_type = Search.find(params["search_id"]).name
        if search_type == "artist"
            search_type = "person"
        end
        my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=#{my_token}&#{search_type}=#{search_term}&page=1&per_page=8"
        json = JSON.parse response 

        if !json['total'].zero?
            @objects = json['objects']
        else
            flash[:error] = "No results for #{search_term} :("
            redirect_to 
        end
    end

    
    
end


