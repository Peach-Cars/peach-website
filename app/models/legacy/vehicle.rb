# Vehicle legacy model
module Legacy
  class Vehicle < ApplicationRecord
    self.table_name = "vehicle_vehicle"
    has_many :listings, class_name: 'Legacy::Listing', foreign_key: 'vehicle_id'
  end
end
