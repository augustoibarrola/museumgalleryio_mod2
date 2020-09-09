class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def show
       @user = User.find_by(id: session[:user_id])
       
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            flash[:success] = "Welcome to your gallery #{@user.name}"
            redirect_to user_path(@user.id)
            
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end
   

    private

    def user_params
        params.require(:user).permit(:name, :email, :bio, :profile_picture, :password, :password_confirmation)
    end
end
