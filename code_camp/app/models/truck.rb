# t = Truck.create(name: "vickis truck")
# t.locations

# presence, length, inclusion

class Truck < ActiveRecord::Base
  has_many :locations
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
end
