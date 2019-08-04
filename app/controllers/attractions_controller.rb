class AttractionsController < ApplicationController
    before_action :is_admin?, only: [:new, :create, :edit, :update]

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.find_or_create_by(name: attraction_params[:name])
        
        redirect_to attraction_path(attraction)
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        attraction = Attraction.find_by(id: params[:id])

        if attraction.update(attraction_params)
            redirect_to attraction_path(attraction)
        else
            flash[:error] = "Attraction did not update."
            render edit_attraction_path(attraction)
        end
    end
    
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
