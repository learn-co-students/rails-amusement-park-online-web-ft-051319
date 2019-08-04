class AttractionsController < ApplicationController
    before_action :is_admin?, only: [:new, :create, :edit, :update]

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.new(attraction_params)

        if attraction.save!
            redirect_to attraction_path(attraction)
        else
            flash[:error] = "Attraction did not save."
            render new_attraction_path
        end
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
