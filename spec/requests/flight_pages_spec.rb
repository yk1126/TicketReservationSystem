require 'spec_helper'

describe "Flight pages" do
  subject { page }

  describe "Search page" do
    before { visit search_path }

    it { should have_content('Search for Flights') }
    it { should have_content('From') }
    it { should have_content('To') }
    it { should have_content('Date') }

    describe "should lead to results page when 'Search' button is clicked" do
      before do
        fill_in "flight_travel_from",         with: "Bangalore"
        fill_in "flight_travel_to",           with: "Goa"
        fill_in "flight_travel_date",         with: "2013-08-01"
        click_button "Search"
      end

      it { should have_title('Flight Reservation System | Results') }
      it { should have_content('Available Flights') }
    end
  end

  describe "Results page" do
    
    before { visit search_path }
    before do
      fill_in "flight_travel_from",         with: "Bangalore"
      fill_in "flight_travel_to",           with: "Delhi"
      fill_in "flight_travel_date",         with: "2013-08-01"
      click_button "Search"
    end

    it { should have_title('Flight Reservation System | Results') }
    it { should have_content('Available Flights') }
   end
end