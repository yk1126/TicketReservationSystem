class Flight < ActiveRecord::Base
  validates :travel_from, presence: true
  validates :travel_to, presence: true

  VALID_DATE_REGEX = /\d\d\-\w\w\w\-\d\d\d\d/i
  validates :travel_date, presence: true, format: { with: VALID_DATE_REGEX }

end
