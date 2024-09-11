# Listing tags legacy model (active, featured, flagged, sold, archived)
module Legacy
  class ListingTag < ApplicationRecord
    self.table_name = "vehicle_vehiclelisting_tags"
    belongs_to :listing, class_name: "Legacy::Listing", foreign_key: "vehiclelisting_id"
    belongs_to :tag, class_name: "Legacy::Tag", foreign_key: 'tag_id'
  end
end
