class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @user=self.user
    @attraction=self.attraction
    errormesg=""
    if @user.tickets < @attraction.tickets
        errormesg << " You do not have enough tickets to ride the #{@attraction.name}."
      end
    if @user.height < @attraction.min_height
        errormesg << " You are not tall enough to ride the #{@attraction.name}."
      end

    if errormesg == ""
       tickets  =  @user.tickets - @attraction.tickets
       happiness = @user.happiness + @attraction.happiness_rating
       nausea= @user.nausea + @attraction.nausea_rating

       @user.update(tickets: tickets, happiness: happiness, nausea: nausea)
       errormesg = "Thanks for riding the #{@attraction.name}!"
      # byebug
     else
       errormesg = "Sorry." + errormesg
     end

  #   errormesg
   end
end
