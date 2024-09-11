# Listing Location Legacy model
module Legacy
  class ListingLocation < ApplicationRecord
    self.table_name = "vehicle_vehiclelistinglocation"
    has_many :listings, class_name: 'Legacy::Listing', foreign_key: 'location_id'
  end
end
