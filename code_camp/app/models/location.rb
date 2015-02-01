# l = Location.create(...)
# l.truck

# Location.find_by(...)

class Location < ActiveRecord::Base
  belongs_to :truck

  validates :day_of_week, presence: true, inclusion: { in: 0..6 } # [0,1,2,3,4,5,6]
  validates :start_hour, :end_hour, presence: true, inclusion: { in: 0..23 }
  validates :lat, presence: true, inclusion: { in: -90..90 }
  validates :long, presence: true, inclusion: { in: -180..180 }
end
