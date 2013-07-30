require 'spec_helper'

describe FlightsController do
  it { should respond_to(:new) }
  it { should respond_to(:create) }
 before { visit search_path }
    render_views
  describe "check if it returns search results" do
   
    before do
      fill_in "flight[travel_from]", with: "Bangalore"
      fill_in "flight[travel_to]", with: "Delhi"
      fill_in "flight[travel_date]", with: "2013-08-05"
      click_button "Search"
    end

    it "should not be nil" do
      @results.should_not be_nil
    end
   
  end
end
