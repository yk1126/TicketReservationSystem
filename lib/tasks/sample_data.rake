namespace :db do
  desc "Fill database with sample data"
  agents = ["Air India", "Kingfisher", "Oman Airways", "Jet Air"]
  sources = ["Bangalore", "Mysore", "Chennai", "Mumbai", "Kolkata"]
  destinations = ["Delhi", "Hyderabad", "Pune", "Goa", "Kochi"]
  date = "01-AUG-2013".to_date
  dates = 10.times.collect { |n|  date + n }
  
  task populate: :environment do
    Flight.create!(travel_from: "Bangalore",
                   travel_to: "Delhi",
                   travel_date: "2013-08-01",
                   travel_agent: "Air India")
    1500.times do |n|
      from  = sources.sample
      to = destinations.sample
      date = dates.sample
      Flight.create!(travel_from: from,
                     travel_to: to,
                     travel_date: date.to_s,
                     travel_agent: agents.sample)
    end
  end
end
