class ApplicationController < ActionController::Base
    #before_action :logged_in_user
    before_action :authorized
    
    def logged_in_user
        @current_user = User.find_by(id: session[:user_id])
    end

    #logged_in_user sets @current_user to whoever is signed in at the moment. 

    def authorized
        if !logged_in_user
            redirect_to '/'
            flash[:error] = "Please login or Create user"
        end
    end

end
