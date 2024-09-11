# Listing legacy model
module Legacy
  class Listing < ApplicationRecord
    self.table_name = "vehicle_vehiclelisting"
    has_many :listing_tags, class_name: 'Legacy::ListingTag', foreign_key: 'vehiclelisting_id'
    has_many :tags, through: :listing_tags, class_name: 'Legacy::Tag'
    has_many :listing_images, class_name: 'Legacy::ListingImage', foreign_key: 'listing_id'
    has_many :listing_prices, class_name: 'Legacy::ListingPrice', foreign_key: 'listing_id'
    belongs_to :listing_location, class_name: 'Legacy::ListingLocation', foreign_key: 'location_id'
    belongs_to :listing_relationship_manager, class_name: 'Legacy::ListingRelationshipManager', foreign_key: 'seller_relation_manager_id'
    belongs_to :vehicle, class_name: 'Legacy::Vehicle', foreign_key: 'vehicle_id'
    belongs_to :cover_photo, class_name: 'Legacy::ListingCoverPhoto', foreign_key: 'cover_image_id'

  end
end
