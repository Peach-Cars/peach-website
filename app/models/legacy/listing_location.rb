# == Schema Information
#
# Table name: vehicle_vehiclelistinglocation
#
#  id       :bigint           not null, primary key
#  created  :timestamptz      not null
#  modified :timestamptz      not null
#  name     :string(50)       not null
#
# Listing Location Legacy model
module Legacy
  class ListingLocation < ApplicationRecord
    self.table_name = "vehicle_vehiclelistinglocation"
    has_many :listings, class_name: 'Legacy::Listing', foreign_key: 'location_id'
  end
end
