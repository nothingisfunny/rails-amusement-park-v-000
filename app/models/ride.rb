class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find(self.user_id)
    attraction = Attraction.find(self.attraction_id)
    can_afford = user.tickets - attraction.tickets 
    tall_enough = user.height - attraction.min_height
    
    if can_afford >= 0 && tall_enough >= 0
      user.update(tickets: can_afford, nausea: user.nausea + attraction.nausea_rating, happiness: user.happiness + attraction.happiness_rating)
      "Thanks for riding the #{attraction.name}!"
    elsif can_afford < 0 && tall_enough < 0
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif can_afford < 0
     "Sorry. You do not have enough tickets to ride the #{attraction.name}"
    elsif tall_enough < 0
     "Sorry. You are not tall enough to ride the #{attraction.name}"
    end
  end
end
