require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "Home page" do
    before { visit '/static_pages/home' }

    it { should have_title('Flight Reservation System')}
    it { should have_link('Search for Flights') }

    describe "The 'Search for Flights' link should take user to the Search page" do
      before { click_link 'Search for Flights' }
      
      it { should have_content("From") }
      it { should have_content("To") }
      it { should have_content("Date") }
    end
  end

  describe "Search page" do
    before { visit '/static_pages/search' }

    it { should have_title('Flight Reservation System | Search')}
  end
  
end
