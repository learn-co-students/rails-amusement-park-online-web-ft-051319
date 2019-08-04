class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if enough_tickets_to_ride? < 0 && is_user_tall_enough? < 0
            self.errors[:base] << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
            self.errors.full_messages.join
        elsif enough_tickets_to_ride? < 0 && is_user_tall_enough? >= 0
            self.errors[:base] << "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
            self.errors.full_messages.join
        elsif enough_tickets_to_ride? >= 0 && is_user_tall_enough? < 0
            self.errors[:base] << "Sorry. You are not tall enough to ride the #{self.attraction.name}."
            self.errors.full_messages.join
        else
            new_tickets = enough_tickets_to_ride?
            new_nausea = self.user.nausea + self.attraction.nausea_rating
            new_happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
        end
    end

    def enough_tickets_to_ride?
        self.user.tickets - self.attraction.tickets
    end

    def is_user_tall_enough?
        self.user.height - self.attraction.min_height
    end

    # validate :user_has_enough_tickets, :user_is_tall_enough

    # def user_has_enough_tickets
    #     if self.user.tickets < self.attraction.tickets
    #         errors[:base] << "You do not have enough tickets to ride the #{self.attraction.name}."
    #     end
    # end

    # def user_is_tall_enough
    #     if self.user.height < self.attraction.min_height
    #         errors[:base] << "You are not tall enough to ride the #{self.attraction.name}."
    #     end
    # end

    # def take_ride
    #     if self.valid?
    #         new_tickets = self.user.tickets - self.attraction.tickets
    #         new_nausea = self.user.nausea + self.attraction.nausea_rating
    #         new_happiness = self.user.happiness + self.attraction.happiness_rating
    #         self.user.update(tickets: new_tickets, nausea: new_nausea, happiness: new_happiness)
    #     else
    #         "Sorry. " + self.errors.full_messages.join(" ")
    #     end
    # end

end