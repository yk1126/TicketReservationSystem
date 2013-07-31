require 'spec_helper'

describe FlightsController do
  it { should respond_to(:new) }
  it { should respond_to(:create) }
  it { should respond_to(:results) }

  it "should render 'results' page if all fields are valid" do
    post :create, flight: { travel_from: "Bangalore",
                            travel_to: "Goa",
                            travel_date: "2013-08-01" }
    response.should render_template('results')
  end

  it "should render 'new' page if any fields are missing" do
    post :create, flight: { travel_from: nil }
    response.should render_template('new')
  end
  
end
