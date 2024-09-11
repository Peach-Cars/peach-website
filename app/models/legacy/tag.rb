# Listing tags legacy model (active, featured, flagged, sold, archived)
module Legacy
  class Tag < ApplicationRecord
    self.table_name = "vehicle_tag"
    has_many :listing_tags, class_name: 'Legacy::ListingTag', foreign_key: 'tag_id'
    has_many :listings, through: :listing_tags, source: :listing
  end
end
