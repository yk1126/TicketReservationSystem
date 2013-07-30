namespace :db do
  desc "Fill database with sample data"
  agents = ["Air India", "Kingfisher", "Oman Airways", "Jet Air"]
  sources = ["Bangalore", "Mysore", "Chennai", "Mumbai", "Kolkata"]
  destinations = ["Delhi", "Hyderabad", "Pune", "Goa", "Kochi"]
  date = "01-AUG-2013".to_date
  dates = 10.times.collect { |n|  date + n }
  time_of_flight = "00:00".to_time
  time_list = 48.times.each.collect { |step| (time_of_flight + (step * 1800)).to_time.strftime('%H:%M') } 

  
  task populate: :environment do
    Flight.create!(travel_from: "Bangalore",
                   travel_to: "Delhi",
                   travel_date: "2013-08-01",
                   travel_agent: "Air India",
                   flight_time: "05:00")
    1500.times do |n|
      from  = sources.sample
      to = destinations.sample
      date = dates.sample
      Flight.create!(travel_from: from,
                     travel_to: to,
                     travel_date: date.to_s,
                     travel_agent: agents.sample,
                     flight_time: time_list.sample)
    end
  end
end
