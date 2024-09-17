# == Schema Information
#
# Table name: vehicle_vehiclelistinglocation
#
#  id       :bigint           not null, primary key
#  created  :timestamptz      not null
#  modified :timestamptz      not null
#  name     :string(50)       not null
#
require 'rails_helper'

RSpec.describe Legacy::ListingLocation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
