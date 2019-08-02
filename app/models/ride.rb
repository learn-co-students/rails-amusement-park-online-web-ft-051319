class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    # def take_ride
    #     if !check_height && check_tickets
    #         self.user.tickets -= self.attraction.tickets
    #         self.user.happiness += self.attraction.happiness_rating
    #         self.user.nausea += self.attraction.nausea_rating
    #     end
    # end
    
    def take_ride
        if !check_height.nil? && !check_tickets.nil?
            "#{check_tickets} #{check_height.gsub("Sorry. ","")}"
        elsif !check_height.nil?
            check_height
        elsif !check_tickets.nil?
            check_tickets
        else
            self.user.update(tickets: self.user.tickets -= self.attraction.tickets)
            self.user.update(happiness: self.user.happiness += self.attraction.happiness_rating)
            self.user.update(nausea: self.user.nausea += self.attraction.nausea_rating)
        end
    end

    def check_height
        unless self.user.height > self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        end
    end

    def check_tickets
        unless self.user.tickets > self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        end
    end


end
