class UsersController < ApplicationController
  def new
    @user = User.new

  end
  def create
    @user = User.create(user_params)
    # byebug
    if @user == "" || @user.id == nil
      redirect_to new_user_path, alert: "Passwords don't match"
    else
      session[:user_id] = @user.id
      # byebug
      redirect_to user_path(@user)
    end

  end

  def show

    if session[:user_id] != nil # byebug
      @user = User.find(params[:id])


    else
      redirect_to root_url
    end
  end

  def update

    if session[:user_id] != nil # byebug
      @user = User.find(params[:id])
    #  byebug
      @attraction=Attraction.find(params[:attr_id])

      tryride=Ride.create(user_id: @user.id, attraction_id: @attraction.id)

      @message=tryride.take_ride
        #  byebug
        @user=User.find(params[:id])
      #byebug
      render :show
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password, :password_confirmation)
  end
end
