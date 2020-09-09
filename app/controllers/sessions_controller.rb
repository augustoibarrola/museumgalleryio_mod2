class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :log_in]
    
    def new
    
    end

    def login
        user = User.find_by(name: params[:sessions][:name])

            # Authenticate a user by their password
        if user && user.authenticate(params[:session][:password])
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
