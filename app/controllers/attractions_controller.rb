class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end 

    def new
        @attraction = Attraction.new
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end 

    def show
        @user = User.find(session[:user_id])
        @attraction = Attraction.find(params[:id])
    end 

    def edit 
        @attraction = Attraction.find(params[:id])
    end 

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update_attributes(attraction_params)
        redirect_to attraction_path(@attraction)
    end 

    private

    def attraction_params
        params.require(:attraction).permit(:id, :name,:tickets,:happiness_rating, :nausea_rating, :min_height)
    end 


end
