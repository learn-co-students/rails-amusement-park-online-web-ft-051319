class UsersController < ApplicationController

    def index
        @users = User.all 
    end 

    def new 
        @user = User.new 
    end 

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end 

    def show 
        @user = User.find(params[:id])
        if @user.id == session[:user_id]
            render 'show'
        else 
            redirect_to '/'
        end
    end 

    private 

    def user_params 
        params.require(:user).permit(:id, :name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end 

end
