class UsersController < ApplicationController
    def new
        @user = User.new 
    end

    def welcome
    end

    def create
        # binding.pry
        @user = User.create(user_params)
        session[:user_id] = @user.id
        
        redirect_to user_path(@user)
    end

    def show
        if logged_in?
            @user = User.find_by(id: session[:user_id])
        else
            redirect_to '/'
        end
    end

    def signin
        # binding.pry

    end

    def authenticate
        # binding.pry
        if params[:user_name] && params[:password]
            user = User.find_by(id: params[:user_name])
            if user.authenticate(params[:password])
                @user = user
                session[:user_id] = @user.id

                redirect_to user_path(@user)
            else
                redirect_to '/'
            end
        end
    end

    def update
        # binding.pry
        @user = User.find_by(id: session[:user_id])
        attraction = Attraction.find_by(id: params[:attraction_id])
        ride = @user.rides.build(attraction_id: attraction.id)
        ride.save 

        # binding.pry 

        if !ride.check_height.nil? && !ride.check_tickets.nil?
            flash[:alert] = "You are not tall enough to ride the #{attraction.name} You do not have enough tickets to ride the #{attraction.name}"
            redirect_to user_path(@user)
        elsif !ride.check_height.nil?
            flash[:alert] = "You are not tall enough to ride the #{attraction.name}"
            redirect_to user_path(@user)
        elsif !ride.check_tickets.nil?
            flash[:alert] = "You do not have enough tickets to ride the #{attraction.name}"
            redirect_to user_path(@user)
        else
            

            ride.take_ride 

            flash[:message] = "Thanks for riding the #{attraction.name}!"
            redirect_to user_path(@user)
        end
    end

    def logout
        session.delete :user_id
        redirect_to '/'
    end


    private

    def logged_in?
        User.find_by(id: session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin, attraction: [])
    end
end
