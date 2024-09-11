# Listing Price legacy model
module Legacy
  class ListingPrice < ApplicationRecord
    self.table_name = "vehicle_vehiclelistingpricehistory"
    belongs_to :listing, class_name: "Legacy::Listing", foreign_key: "listing_id"
  end
end
