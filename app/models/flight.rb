class Flight < ActiveRecord::Base
  validates :travel_from, presence: true
  validates :travel_to, presence: true
  VALID_TRAVEL_DATE_REGEX = /\d\d\d\d\-\d\d\-\d\d/i
  validates :travel_date, presence: true, format: { with: VALID_TRAVEL_DATE_REGEX } 
end
