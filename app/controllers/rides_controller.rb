class RidesController < ApplicationController
  def new
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.save
    alert = @ride.take_ride
    redirect_to :controller => "users", :action => "show", :id => session[:user_id], :alert => alert
  end
end
