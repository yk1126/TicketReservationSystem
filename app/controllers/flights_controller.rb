class FlightsController < ApplicationController
  attr_accessor :results, :step_count
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    
    if @flight.valid?
      @step_count = 0
      cookies[:step_count] = @step_count
      cookies[:to] = @flight.travel_to
      cookies[:from] = @flight.travel_from
      cookies[:date] = @flight.travel_date
      redirect_to :action => 'wait'
    else
      render 'new'
    end   
  end

  def results
    @results = Flight.where(travel_from: cookies[:from], travel_to: cookies[:to], travel_date: cookies[:date])
  end

  def wait
    @step_count = cookies[:step_count].to_i
    if @step_count < 5
      @step_count += 1
      cookies[:step_count] = @step_count
      redirect_after_delay('wait', rand(5), @step_count)
    else
     redirect_to :action => 'results'
    end
  end

  ############################PRIVATE METHODS#################################

  private

    def flight_params
      params.require(:flight).permit(:travel_from, :travel_to, :travel_date)
    end
end
