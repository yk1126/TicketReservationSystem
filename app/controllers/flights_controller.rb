class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    unless @flight.valid?
      render 'new'
    end
  end

  #############################################################
  private

    def user_params
      params.require(:flight).permit(:travel_from, :travel_to, :travel_date)
    end
end
