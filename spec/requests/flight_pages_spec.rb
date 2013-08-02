require 'spec_helper'

describe "Flight pages" do
  subject { page }

  describe "Search page" do
    before { visit search_path }

    it { should have_content('Search for Flights') }
    it { should have_content('From') }
    it { should have_content('To') }
    it { should have_content('Date') }

    describe "should lead to 'wait' page when 'Search' button is clicked" do
      before do
        fill_in "flight_travel_from",         with: "Bangalore"
        fill_in "flight_travel_to",           with: "Goa"
        fill_in "flight_travel_date",         with: "01-AUG-2013"
        click_button "Search"
      end
      
      it { should have_title('Flight Reservation System | Wait') }
      it { should have_content('Search in progress') }
    end
  end

  describe "Results page" do
    
    before { visit results_path }
  
    it { should have_title('Flight Reservation System | Results') }
    it { should have_content('Available Flights') }
  end


  describe "Wait page" do
    before { visit wait_path }
       
    it { should have_title('Flight Reservation System | Wait') }
    it { should have_content('Search in progress')}
  end
end
