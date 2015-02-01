class TrucksController < ApplicationController
  before_action :load_truck, except: [:index]
  respond_to :html

  # show a map of todays trucks
  # localhost:3000/

  # @users = User.all
  # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  #   marker.lat user.latitude
  #   marker.lng user.longitude
  # end

  def index
    todays_locations = Location.where(day_of_week: 4)
    @hash = Gmaps4rails.build_markers(todays_locations) do |location, marker|
      truck = location.truck
      marker.lat location.lat
      marker.lng location.long
      marker.infowindow "<h3>#{truck.name}</h3>
      <p>#{truck.description}</p>
      <p>#{location.start_hour} - #{location.end_hour}</p>"
    end
    respond_with @hash
  end

  # localhost:3000/1
  def show
    respond_with @truck
  end

  # def update
  # end

  # def edit
  # end

  private

  def load_truck
    @truck = Truck.find(params[:id])
  end
end
