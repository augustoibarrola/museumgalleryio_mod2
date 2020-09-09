class UserArtsController < ApplicationController

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

    private

    def user_art_params
        params.require(:user_art).permit(:image, :url_link, :title, :blurb)
    end
end
