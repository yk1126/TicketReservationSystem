class FlightsController < ApplicationController
  attr_accessor :results
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)

    logger.debug "******************************"
    logger.debug @flight.travel_from
    logger.debug @flight.travel_to
    logger.debug @flight.travel_date
    logger.debug "------------------------------------" 
    @results = Flight.where(travel_from: @flight.travel_from,
                            travel_to: @flight.travel_to,
                            travel_date: @flight.travel_date)
    logger.debug "------------------------------------" 
    puts @results.to_a
    logger.debug "******************************"
    
    if @flight.valid?
      render 'results'
    else
      render 'new'
    end   
  end

  def results
    
  end

  #############################################################
  private

    def flight_params
      params.require(:flight).permit(:travel_from, :travel_to, :travel_date)
    end
end
