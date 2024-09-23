# == Schema Information
#
# Table name: vehicle_vehiclelisting
#
#  id                              :bigint           not null, primary key
#  created                         :timestamptz      not null
#  modified                        :timestamptz      not null
#  selling_price                   :float            not null
#  active                          :boolean          not null
#  vehicle_id                      :bigint           not null
#  description                     :text
#  grade                           :string(10)
#  logbook_info_confirmed          :boolean          not null
#  seller_verified                 :boolean          not null
#  title                           :string(45)
#  viewing_at_hq_available         :boolean          not null
#  accident_free                   :boolean          not null
#  inspected_by_peach              :boolean          not null
#  inspection_report_available     :boolean          not null
#  mileage_verified_genuine        :boolean          not null
#  cover_image_id                  :bigint
#  basic_features                  :text
#  driving_specs                   :text
#  interior_exterior               :text
#  mileage                         :integer
#  sourced_from                    :string(5)        not null
#  peach_assurance                 :text
#  meta_description                :text
#  meta_keywords                   :text
#  location_id                     :bigint
#  current_status_id               :bigint
#  sales_person_id                 :bigint
#  humanized_sale_turn_around_time :string(100)
#  seller_relation_manager_id      :bigint
#  listed_on                       :timestamptz
#
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
