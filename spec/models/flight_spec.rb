require 'spec_helper'

describe Flight do
  before { @flight = Flight.new(travel_from: "Bangalore", travel_to: "Mumbai", travel_date: "11-AUG-2013") }
  subject { @flight }

  it { should respond_to(:travel_from) }
  it { should respond_to(:travel_to) }
  it { should respond_to(:travel_date) }

  describe "Validations" do
    describe "if all fields are present" do
      it { should be_valid }
    end
    
    describe " if any field is missing " do
      describe "travel_from not present" do
        before { @flight.travel_from = "" }
        it { should_not be_valid }
      end
      describe "travel_to not present" do
        before { @flight.travel_to = "" }
        it { should_not be_valid }
    end
      describe "travel_date not present" do
        before { @flight.travel_date = "" }
        it { should_not be_valid }
      end
    end
  end
end
