class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end
  def create
    @attraction=Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end
  def index
    @user = User.find(session[:user_id])
    @admin= @user.admin
    @attractions=Attraction.all

  end
  def show
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    end
    @admin = @user.admin
    @attraction = Attraction.find(params[:id])

  end
  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height))

    redirect_to attraction_path(@attraction)
  end
  private

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
