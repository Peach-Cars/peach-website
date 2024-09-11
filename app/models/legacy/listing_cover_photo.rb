# Listing Image legacy model
module Legacy
  class ListingCoverPhoto < ApplicationRecord
    self.table_name = "vehicle_vehiclelistingimage"
    has_one :listing, class_name: 'Legacy::Listing', foreign_key: 'cover_image_id', primary_key: 'id'
  end
end
