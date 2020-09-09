class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :login]
    
    def new
    
    end

    def login
        user = User.find_by(email: params[:session][:email])

        # Authenticate a user by their password
        if user && user.authenticate(params[:session][:password])
            byebug
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:error] = "Username or Password Incorrect"
            redirect_to new_login_path
        end  
    end

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end


end
# 