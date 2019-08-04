class RidesController < ApplicationController
    def create
        ride = Ride.find_or_create_by(ride_params)
        ride.take_ride
        if ride.errors.messages.empty?
            flash[:thank_you] = "Thanks for riding the #{ride.attraction.name}!"

            redirect_to user_path(current_user)
        else
            flash[:error] = ride.errors.full_messages.join

            redirect_to user_path(current_user)
        end
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
