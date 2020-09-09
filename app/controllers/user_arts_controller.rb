class UserArtsController < ApplicationController

    def new
    @art_data = {
        "image" => params["image"],
        "url_link" => params["url_link"],
        "title" => params["title"]
    }
    @user_art = UserArt.new
    end
    
    def create
        #@user_art_data = params["user_art"]
        @UserArt = UserArt.create(user_art_params)
        byebug
    end

    private

    def user_art_params
        params.require(:user_art).permit(:image, :url_link, :title, :blurb, :user_id)
    end
end
