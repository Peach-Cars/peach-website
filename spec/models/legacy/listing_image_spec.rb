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
require 'rails_helper'

RSpec.describe Legacy::ListingImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
