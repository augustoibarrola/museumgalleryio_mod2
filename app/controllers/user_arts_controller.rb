class UserArtsController < ApplicationController
    skip_before_action :authorized, only: [:discover]
    def show
        @user_art = UserArt.find(params[:id])
        @comment = Comment.new
    end

    def new
    
    @art_data = {
        "image" => params["image"],
        "url_link" => params["url_link"],
        "title" => params["title"]
    }
    
    @user_art = UserArt.new

    end
    
    def create
        #@UserArt = UserArt.create(user_art_params)
        
        @current_user.favorites << UserArt.create(user_art_params)
        redirect_to user_path(@current_user)
    end

    def discover
        my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        json = JSON.parse response 
        object_id = json["objects"].sample["id"]
        object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{object_id}"
        object_json = JSON.parse object_response
        @art = object_json["object"]
    end

    def logged_discover
        my_token = ENV["TOKEN"]
        response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getOnDisplay&access_token=" + my_token
        json = JSON.parse response 
        object_id = json["objects"].sample["id"]
        object_response = RestClient.get "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.objects.getInfo&access_token=#{my_token}&object_id=#{object_id}"
        object_json = JSON.parse object_response
        @art = object_json["object"]
    end

    def destroy
        @user_art = UserArt.find(params[:id])
        @user_art.destroy

        redirect_to user_path(@current_user)
    end

    private

    def user_art_params
        params.require(:user_art).permit(:image, :url_link, :title, :blurb)
    end
end
