class Flight < ActiveRecord::Base
  validates :travel_from, presence: true
  validates :travel_to, presence: true
  validates :travel_date, presence: true
end
