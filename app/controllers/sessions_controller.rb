
class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :login]
    
    def new
    end

    def create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.profile_picture = auth['info']['image']
        end

        binding.pry
        session[:user_id] = @user.id
        
        redirect_to user_path(@user)
    end

    def login
<<<<<<< HEAD
        user = User.find_by(email: params[:sessions][:email])
=======
        user = User.find_by(email: params[:session][:email])
>>>>>>> master

        # Authenticate a user by their password
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            flash[:error] = "Username or Password Incorrect 😨 "
            redirect_to new_login_path
        end  
    end

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
