class SessionsController < ApplicationController

  def new
  end

  def create
    # byebug
    @user = User.find_by(name: params[:user][:name])
  #  binding.pry
    # byebug
    if @user == "" or @user == nil
      redirect_to sessions_new_path, alert: "no such user"
    else
      # binding.pry
      return  head(:forbidden) unless @user.authenticate(params[:password])
      # binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end
    # end
  end

  def destroy
    # byebug
    session.clear
    redirect_to root_path
  end
end
