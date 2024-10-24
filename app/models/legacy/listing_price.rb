# == Schema Information
#
# Table name: vehicle_vehiclelistingpricehistory
#
#  id            :bigint           not null, primary key
#  created       :timestamptz      not null
#  modified      :timestamptz      not null
#  selling_price :string(45)       not null
#  listing_id    :bigint           not null
#
module Legacy
  class ListingPrice < ApplicationRecord
    self.table_name = "vehicle_vehiclelistingpricehistory"
    belongs_to :listing, class_name: "Legacy::Listing", foreign_key: "listing_id"
  end
end
