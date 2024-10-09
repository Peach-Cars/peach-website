# == Schema Information
#
# Table name: vehicle_vehiclelistingimage
#
#  id           :bigint           not null, primary key
#  image        :string(100)
#  name         :string(45)
#  description  :text
#  listing_id   :bigint           not null
#  order_no     :integer          not null
#  created      :timestamptz      not null
#  modified     :timestamptz      not null
#  is_processed :boolean          not null
#
module Legacy
  class ListingCoverPhoto < ApplicationRecord
    self.table_name = "vehicle_vehiclelistingimage"
    has_one :listing, class_name: 'Legacy::Listing', foreign_key: 'cover_image_id', primary_key: 'id'
  end
end
