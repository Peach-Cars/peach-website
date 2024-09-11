# Listing Image legacy model
module Legacy
  class ListingImage < ApplicationRecord
    self.table_name = "vehicle_vehiclelistingimage"
    belongs_to :listing, class_name: 'Legacy::Listing', foreign_key: 'listing_id'
  end
end
