require 'spec_helper'

describe "Flight pages" do
  subject { page }

  describe "Search page" do
    before { visit search_path }

    it { should have_content('Search for Flights') }
    it { should have_content('From') }
    it { should have_content('To') }
    it { should have_content('Date') }
  end
end
