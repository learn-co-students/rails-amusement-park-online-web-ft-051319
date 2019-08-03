
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if params[:attraction_id] #showing that the user came from clicking on "Go on this ride"
      @ride = Ride.find_or_create_by(attraction_id: params[:attraction_id], user_id: @user.id)
      @ride.take_ride
      @user=@ride.user #needed to update the user's tickets and happines/nausea numbers
      @user.save
    end
    redirect_to root_path if !session[:user_id]
  end

  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:happiness,:height,:nausea,:tickets,:password,:password_confirmation, :admin)
  end


end
